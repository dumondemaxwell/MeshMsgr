import 'package:mesh_msgr/constants/constants.dart';
import 'package:mesh_msgr/functions/localizations.dart';
import 'package:mesh_msgr/pages/more/account_setting/delete_account.dart';
import 'package:mesh_msgr/pages/more/account_setting/privacy.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Text(
          AppLocalizations.of(context)!.translate('account', 'accountString'),
          style: appBarTextStyle,
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () => Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: PrivacySetting())),
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(
                Icons.lock,
                color: greyColor,
                size: 22.0,
              ),
            ),
            title: Text(
              AppLocalizations.of(context)!
                  .translate('account', 'privacyString'),
              style: blackNormalTextStyle,
            ),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: DeleteAccount())),
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(
                Icons.delete,
                color: greyColor,
                size: 22.0,
              ),
            ),
            title: Text(
              AppLocalizations.of(context)!
                  .translate('account', 'deleteMyAccountString'),
              style: blackNormalTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
