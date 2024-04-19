import 'dart:io';

import 'package:mesh_msgr/constants/constants.dart';
import 'package:mesh_msgr/functions/localizations.dart';
import 'package:mesh_msgr/pages/auth/create_account.dart';
import 'package:mesh_msgr/pages/auth/privacy_policy.dart';
import 'package:mesh_msgr/pages/auth/terms_of_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                  Container(
                    width: 260.0,
                    height: 260.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(130.0),
                      color: primaryColor.withOpacity(0.65),
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      FontAwesomeIcons.whatsapp,
                      color: whiteColor,
                      size: 130.0,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    strutStyle: const StrutStyle(
                      height: 2.0,
                    ),
                    text: TextSpan(
                      text: 'Read our ',
                      style: greyNormalTextStyle,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Privacy Policy',
                          style: blueNormalTextStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: PrivacyPolicy()));
                            },
                        ),
                        TextSpan(
                          text: '. Tap \"Agree and continue\" to accept the ',
                          style: greyNormalTextStyle,
                        ),
                        TextSpan(
                          text: 'Terms of Service.',
                          style: blueNormalTextStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: TermsOfService()));
                            },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: const CreateAccount()));
                    },
                    child: Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width -
                          (fixPadding * 8.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.0),
                        color: primaryColor,
                      ),
                      child: Text(
                        AppLocalizations.of(context)!
                            .translate('onboarding', 'agreeAndContinueString')
                            .toUpperCase(),
                        style: TextStyle(
                          fontSize: 18.0,
                          color: whiteColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60.0),
                ],
              ),
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
