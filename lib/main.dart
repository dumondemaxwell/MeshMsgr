import 'dart:convert';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mesh_msgr/constants/constants.dart';
import 'package:mesh_msgr/functions/change_language.dart';
import 'package:mesh_msgr/functions/localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mesh_msgr/pages/auth/onboarding.dart';
import 'package:mesh_msgr/realm/app_services.dart';
import 'package:mesh_msgr/realm/realm_services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: ".env");

  Config realmConfig = await Config.getConfig('assets/config/atlasConfig.json');

  WidgetsFlutterBinding.ensureInitialized();
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider<Config>(create: (_) => realmConfig),
        ChangeNotifierProvider<AppLanguage>(create: (_) => appLanguage),
        ChangeNotifierProvider<AppServices>(
            create: (_) => AppServices(realmConfig.appId, realmConfig.baseUrl)),
        ChangeNotifierProxyProvider<AppServices, RealmServices?>(
            // RealmServices can only be initialized if the user is logged in.
            create: (context) => null,
            update: (BuildContext context, AppServices appServices,
                RealmServices? realmServices) {
              return appServices.currentUser != null
                  ? RealmServices(appServices.app)
                  : null;
            }),
      ], child: MyApp(
        appLanguage: appLanguage,
      )));
  });
}

class MyApp extends StatelessWidget {
  late AppLanguage? appLanguage;

  MyApp({super.key, this.appLanguage});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppLanguage>(
      create: (_) => appLanguage!,
      child: Consumer<AppLanguage>(builder: (context, model, child) {
        return MaterialApp(
          title: 'Mesh Messenger',
          theme: ThemeData(
            primaryColor: primaryColor,
            primarySwatch: Colors.pink,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'Rubik',
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: primaryColor,
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: OnBoarding(),
          locale: model.appLocal,
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('hi', ''),
            Locale('ar', ''),
            Locale('zh', ''),
            Locale('tr', ''),
          ],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
        );
      }),
    );
  }
}

// This class gets app info from `atlasConfig.json`, which is
// automatically populated by the server when you download the
// template app through the Atlas App Services UI or CLI.
class Config extends ChangeNotifier {
  late String appId;
  late String atlasUrl;
  late Uri baseUrl;

  Config._create(dynamic realmConfig) {
    appId = realmConfig['appId'];
    atlasUrl = realmConfig['dataExplorerLink'];
    baseUrl = Uri.parse(realmConfig['baseUrl']);
  }

  static Future<Config> getConfig(String jsonConfigPath) async {
    dynamic realmConfig =
    json.decode(await rootBundle.loadString(jsonConfigPath));

    var config = Config._create(realmConfig);

    return config;
  }
}
