import 'dart:io';

import 'package:mesh_msgr/constants/constants.dart';
import 'package:mesh_msgr/functions/localizations.dart';
import 'package:mesh_msgr/pages/calls/calls.dart';
import 'package:mesh_msgr/pages/chat/chat.dart';
import 'package:mesh_msgr/pages/groups/groups.dart';
import 'package:mesh_msgr/pages/more/more.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int? currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: StyleProvider(
        style: Style(),
        child: ConvexAppBar(
          items: [
            TabItem(
              icon: Icons.call,
              title: AppLocalizations.of(context)!
                  .translate('bottomBar', 'callsString'),
            ),
            TabItem(
              icon: Icons.chat_bubble_outline,
              title: AppLocalizations.of(context)!
                  .translate('bottomBar', 'chatString'),
            ),
            TabItem(
              icon: Icons.currency_exchange,
              title: AppLocalizations.of(context)!
                  .translate('bottomBar','paymentsString'),
            ),
            TabItem(
              icon: Icons.settings,
              title: AppLocalizations.of(context)!
                  .translate('bottomBar', 'settingsString'),
            ),
          ],
          initialActiveIndex: currentIndex,
          height: 50,
          top: -30,
          curveSize: 100,
          curve: Curves.easeInCirc,
          onTap: (int i) => changePage(i),
          backgroundColor: primaryColor,
          elevation: 5.0,
        ),
      ),
      body: PopScope(
        child: (currentIndex == 0)
            ? Calls()
            : (currentIndex == 1)
                ? const Chat()
                : More(),
        onPopInvoked: (state) async {
          if(state){
            exit(0);
          }
        },
      ),
    );
  }
}

class Style extends StyleHook {
  @override
  double get activeIconSize => 30;

  @override
  double get activeIconMargin => 15;

  @override
  double get iconSize => 20;

  @override
  TextStyle textStyle(Color color, String? style) {
    return const TextStyle(fontSize: 10.0, color: Colors.white);
  }
}
