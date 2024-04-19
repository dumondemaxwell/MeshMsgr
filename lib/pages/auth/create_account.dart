import 'dart:io';

import 'package:mesh_msgr/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mesh_msgr/functions/localizations.dart';
import 'package:mesh_msgr/pages/auth/otp_screen.dart';
import 'package:page_transition/page_transition.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  Color continueButtonColor = Colors.grey[500]!;
  String phoneNumber = '';
  String? phoneIsoCode;
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');
  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      phoneNumber = number;
      phoneIsoCode = isoCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.rightToLeft, child: OTPScreen()));
        },
        child: Icon(
          Icons.arrow_forward,
          color: whiteColor,
        ),
      ),
      body: WillPopScope(
        child: ListView(
          children: [
            const SizedBox(height: 30.0),
            Padding(
              padding: EdgeInsets.all(fixPadding * 2.0),
              child: Text(
                AppLocalizations.of(context)!.translate(
                    'createAccountPage', 'enterYourMobileNumberString'),
                style: blackBigHeadingTextStyle,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
              child: Text(
                AppLocalizations.of(context)!
                    .translate('createAccountPage', 'sendYouSmsString'),
                style: greyNormalTextStyle,
                strutStyle: const StrutStyle(
                  height: 1.6,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(fixPadding * 2.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!
                        .translate('createAccountPage', 'mobileNumberString'),
                    style: greyMediumBoldTextStyle,
                  ),
                  heightSpace,
                  InternationalPhoneNumberInput(
                    textStyle: TextStyle(
                      color: blackColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                    autoValidateMode: AutovalidateMode.disabled,
                    selectorTextStyle: TextStyle(
                      color: blackColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                    initialValue: number,
                    textFieldController: controller,
                    // inputBorder: InputBorder.none,
                    inputDecoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 10.0, bottom: 13.0),
                      hintText: AppLocalizations.of(context)!
                          .translate('createAccountPage', 'mobileNumberString'),
                      hintStyle: TextStyle(
                        color: greyColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                      // border: InputBorder.none,
                    ),
                    selectorConfig: const SelectorConfig(
                      selectorType: PhoneInputSelectorType.DIALOG,
                    ),
                    onInputChanged: (v) {
                      if (controller.text != '') {
                        setState(() {
                          continueButtonColor = primaryColor;
                        });
                      } else {
                        setState(() {
                          continueButtonColor = Colors.grey[500]!;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
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
