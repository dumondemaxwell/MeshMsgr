import 'package:mesh_msgr/constants/constants.dart';
import 'package:mesh_msgr/functions/localizations.dart';
import 'package:mesh_msgr/pages/chat/message_screen.dart';
import 'package:mesh_msgr/pages/groups/new_group.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({super.key});

  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  final contactList = [
    {
      'name': 'Ronan',
      'profileImage': 'assets/user_profile/user_1.jpg',
      'about': 'Your limitation—it’s only your imagination.'
    },
    {
      'name': 'Brayden',
      'profileImage': 'assets/user_profile/user_2.jpg',
      'about': 'Push yourself, because no one else is going to do it for you.'
    },
    {
      'name': 'Apollonia',
      'profileImage': 'assets/user_profile/user_3.jpg',
      'about': 'Sometimes later becomes never. Do it now.'
    },
    {
      'name': 'Beatriz',
      'profileImage': 'assets/user_profile/user_4.jpg',
      'about': 'Great things never come from comfort zones.'
    },
    {
      'name': 'Shira',
      'profileImage': 'assets/user_profile/user_5.jpg',
      'about': 'Dream it. Wish it. Do it.'
    },
    {
      'name': 'Diego',
      'profileImage': 'assets/user_profile/user_6.jpg',
      'about': 'Success doesn’t just find you. You have to go out and get it.'
    },
    {
      'name': 'Marco',
      'profileImage': 'assets/user_profile/user_7.jpg',
      'about':
          'The harder you work for something, the greater you’ll feel when you achieve it.'
    },
    {
      'name': 'Steffan',
      'profileImage': 'assets/user_profile/user_8.jpg',
      'about': 'Dream bigger. Do bigger.'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocalizations.of(context)!
                  .translate('selectContact', 'selectContactString'),
              style: whiteNormalTextStyle,
            ),
            const SizedBox(height: 3.0),
            Text(
              '232 contacts ${AppLocalizations.of(context)!.translate('selectContact', 'contactsString')}',
              style: whiteSmallTextStyle,
            )
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contactList.length,
        itemBuilder: (context, index) {
          final item = contactList[index];

          return (index == 0)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: NewGroup()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(fixPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 50.0,
                              height: 50.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                color: primaryColor,
                              ),
                              child: Icon(
                                Icons.group,
                                color: whiteColor,
                                size: 20.0,
                              ),
                            ),
                            widthSpace,
                            Expanded(
                              child: Text(
                                AppLocalizations.of(context)!.translate(
                                    'selectContact', 'newGroupString'),
                                style: blackNormalTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     PageTransition(
                        //         type: PageTransitionType.rightToLeft,
                        //         child: MessageScreen(
                        //           name: item['name'],
                        //           imagePath: item['profileImage'],
                        //         )));
                      },
                      child: Container(
                        padding: EdgeInsets.all(fixPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 50.0,
                              height: 50.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                image: DecorationImage(
                                  image: AssetImage(item['profileImage']!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            widthSpace,
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['name']!,
                                    style: blackNormalTextStyle,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    item['about']!,
                                    style: greySmallTextStyle,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : (index == (contactList.length - 1))
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     PageTransition(
                            //         type: PageTransitionType.rightToLeft,
                            //         child: MessageScreen(
                            //           name: item['name'],
                            //           imagePath: item['profileImage'],
                            //         )));
                          },
                          child: Container(
                            padding: EdgeInsets.all(fixPadding),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    image: DecorationImage(
                                      image: AssetImage(item['profileImage']!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                widthSpace,
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['name']!,
                                        style: blackNormalTextStyle,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 5.0),
                                      Text(
                                        item['about']!,
                                        style: greySmallTextStyle,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(fixPadding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 50.0,
                                height: 50.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                child: Icon(
                                  Icons.share,
                                  color: blackColor,
                                  size: 20.0,
                                ),
                              ),
                              widthSpace,
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context)!.translate(
                                      'selectContact', 'inviteFriendsString'),
                                  style: blackNormalTextStyle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     PageTransition(
                        //         type: PageTransitionType.rightToLeft,
                        //         child: MessageScreen(
                        //           name: item['name'],
                        //           imagePath: item['profileImage'],
                        //         )));
                      },
                      child: Container(
                        padding: EdgeInsets.all(fixPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 50.0,
                              height: 50.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                image: DecorationImage(
                                  image: AssetImage(item['profileImage']!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            widthSpace,
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['name']!,
                                    style: blackNormalTextStyle,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    item['about']!,
                                    style: greySmallTextStyle,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
        },
      ),
    );
  }
}
