import 'dart:io';

import 'package:mesh_msgr/constants/constants.dart';
import 'package:mesh_msgr/functions/localizations.dart';
import 'package:flutter/material.dart';
import 'package:mesh_msgr/pages/bottom_bar.dart';
import 'package:mesh_msgr/realm/app_services.dart';
import 'package:mesh_msgr/realm/realm_services.dart';
import 'package:mesh_msgr/realm/schemas.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final realmServices = Provider.of<RealmServices?>(context, listen: false);
    final appServices = Provider.of<AppServices?>(context, listen: true);

    return Scaffold(
      body: PopScope(
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 80.0),
                  Text(
                    AppLocalizations.of(context)!
                        .translate('onboarding', 'welcomeToMsgrString'),
                    style: primaryColorBigHeadingTextStyle,
                  ),
                  const SizedBox(height: 60.0),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image.asset(
                      'assets/main_launcher_icon.png',
                      fit: BoxFit.cover,
                      width: 260.0,
                      height: 260.0,
                    ),
                  ),
                  const SizedBox(height: 60.0),
                  Container(
                    padding: EdgeInsets.all(fixPadding * 3.0),
                    child:                   Text(
                      AppLocalizations.of(context)!
                          .translate('onboarding', 'description'),
                      style: primaryColorBigHeadingTextStyle,
                    ),
                  ),
                  const SizedBox(height: 60.0),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: fixPadding * 2.5, right: fixPadding * 2.5, bottom: fixPadding * 5),
                child: SignInWithAppleButton(
                  onPressed: () async {
                    final credential = await SignInWithApple.getAppleIDCredential(
                      scopes: [
                        AppleIDAuthorizationScopes.email,
                        AppleIDAuthorizationScopes.fullName,
                      ],
                    );

                    appServices?.loginWithApple(credential.identityToken ?? 'invalid token').then((value) {
                      var objId = ObjectId();
                      var email = value.profile.email;
                      var lastActive = DateTime.now();
                      var createdOn = DateTime.now();
                      var isOnline = true;
                      var avatar = value.profile.pictureUrl;

                      print("object id: $objId email: $email lastActive: $lastActive createdOn: $createdOn isOnline: $isOnline avatar: $avatar}");
                      if(email == null){
                        throw Exception("Email can not be empty");
                      }
                      var user = ApplicationUser(
                        objId,
                        value.id,
                        email,
                        DateTime.now(),
                        DateTime.now(),
                        avatar ?? '',
                        true,
                      );

                      realmServices?.addOrUpdateUser(user, ApplicationUserSettings(
                        ObjectId(),
                        true,
                        true,
                        true,
                        DateTime.now(),
                        DateTime.now()
                      )).then((value){
                          print("object navigate to new route");
                          var newRoute = MaterialPageRoute(builder: (BuildContext context) => const BottomBar());
                          Navigator.of(context).pushAndRemoveUntil(newRoute, (Route<dynamic> route) => false);
                      }).catchError((error){
                        print("object error: $error");
                      });
                    });
                  },
                ),
              ),
              const Spacer()
            ],
          ),
        ),
        onPopInvoked: (bool state) async {
          if (state) {
            exit(0);
          }
        },
      ),
    );
  }

  onWillPop() {
    return true;
  }
}
