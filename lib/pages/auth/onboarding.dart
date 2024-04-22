import 'dart:io';
import 'dart:math';

import 'package:mesh_msgr/constants/constants.dart';
import 'package:mesh_msgr/functions/localizations.dart';
import 'package:flutter/material.dart';
import 'package:mesh_msgr/pages/bottom_bar.dart';
import 'package:mesh_msgr/services/location.dart';
import 'package:mesh_msgr/services/mongo.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class OnBoarding extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final mongoDbService = MongoService();

    return Scaffold(
      body: WillPopScope(
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
                padding: EdgeInsets.all(fixPadding * 3.0),
                child: SignInWithAppleButton(
                  onPressed: () async {
                    var testUsername = "test user";
                    var db = await mongoDbService.initDatabaseAsync();
                    var collection = db.collection('users');
                    collection.findAndModify(
                      query: {
                        'username': testUsername,
                        'email': 'test email',
                        'phone': '6467338401',
                      },
                      update: {
                        r'$set': {
                          'username': testUsername,
                          'email': 'test email',
                          'phone': 'test phone',
                          'created_at': DateTime.now(),
                          'updated_at': DateTime.now(),
                        },
                      },
                      upsert: true,
                    ).then((value) {
                      var route = MaterialPageRoute(builder: (context) => const BottomBar());
                      Navigator.push(context, route);
                    }).catchError((error){
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Invalid Credentials. Please try again.'),
                      ));
                    });
                    //   scopes: [
                    //     AppleIDAuthorizationScopes.email,
                    //     AppleIDAuthorizationScopes.fullName,
                    //   ],
                    // );
                    // print(credential);
                  },
                ),
              ),
              const Spacer()
            ],
          ),
        ),
        onWillPop: () async {
          bool exitStatus = onWillPop();
          if (exitStatus) {
            exit(0);
          }
          return false;
        },
      ),
    );
  }

  onWillPop() {
    return true;
  }
}
