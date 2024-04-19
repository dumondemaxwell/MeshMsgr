import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mesh_msgr/constants/constants.dart';
import 'package:mesh_msgr/functions/change_language.dart';
import 'package:mesh_msgr/functions/localizations.dart';
import 'package:mesh_msgr/pages/auth/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(
      MyApp(
        appLanguage: appLanguage,
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  final AppLanguage? appLanguage;

  MyApp({this.appLanguage});
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
