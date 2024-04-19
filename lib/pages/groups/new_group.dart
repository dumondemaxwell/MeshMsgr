import 'package:mesh_msgr/constants/constants.dart';
import 'package:mesh_msgr/functions/localizations.dart';
import 'package:mesh_msgr/pages/groups/new_group_info.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';

class NewGroup extends StatefulWidget {
  @override
  _NewGroupState createState() => _NewGroupState();
}

class _NewGroupState extends State<NewGroup> {
  int selected = 0;
  final contactList = [
    {
      'name': 'Ronan',
      'profileImage': 'assets/user_profile/user_1.jpg',
      'about': 'Your limitation—it’s only your imagination.',
      'selected': false
    },
    {
      'name': 'Brayden',
      'profileImage': 'assets/user_profile/user_2.jpg',
      'about': 'Push yourself, because no one else is going to do it for you.',
      'selected': false
    },
    {
      'name': 'Apollonia',
      'profileImage': 'assets/user_profile/user_3.jpg',
      'about': 'Sometimes later becomes never. Do it now.',
      'selected': false
    },
    {
      'name': 'Beatriz',
      'profileImage': 'assets/user_profile/user_4.jpg',
      'about': 'Great things never come from comfort zones.',
      'selected': false
    },
    {
      'name': 'Shira',
      'profileImage': 'assets/user_profile/user_5.jpg',
      'about': 'Dream it. Wish it. Do it.',
      'selected': false
    },
    {
      'name': 'Diego',
      'profileImage': 'assets/user_profile/user_6.jpg',
      'about': 'Success doesn’t just find you. You have to go out and get it.',
      'selected': false
    },
    {
      'name': 'Marco',
      'profileImage': 'assets/user_profile/user_7.jpg',
      'about':
          'The harder you work for something, the greater you’ll feel when you achieve it.',
      'selected': false
    },
    {
      'name': 'Steffan',
      'profileImage': 'assets/user_profile/user_8.jpg',
      'about': 'Dream bigger. Do bigger.',
      'selected': false
    },
    {
      'name': 'Ronan',
      'profileImage': 'assets/user_profile/user_1.jpg',
      'about': 'Your limitation—it’s only your imagination.',
      'selected': false
    },
    {
      'name': 'Brayden',
      'profileImage': 'assets/user_profile/user_2.jpg',
      'about': 'Push yourself, because no one else is going to do it for you.',
      'selected': false
    },
    {
      'name': 'Apollonia',
      'profileImage': 'assets/user_profile/user_3.jpg',
      'about': 'Sometimes later becomes never. Do it now.',
      'selected': false
    },
    {
      'name': 'Beatriz',
      'profileImage': 'assets/user_profile/user_4.jpg',
      'about': 'Great things never come from comfort zones.',
      'selected': false
    },
    {
      'name': 'Shira',
      'profileImage': 'assets/user_profile/user_5.jpg',
      'about': 'Dream it. Wish it. Do it.',
      'selected': false
    },
    {
      'name': 'Diego',
      'profileImage': 'assets/user_profile/user_6.jpg',
      'about': 'Success doesn’t just find you. You have to go out and get it.',
      'selected': false
    },
    {
      'name': 'Marco',
      'profileImage': 'assets/user_profile/user_7.jpg',
      'about':
          'The harder you work for something, the greater you’ll feel when you achieve it.',
      'selected': false
    },
    {
      'name': 'Steffan',
      'profileImage': 'assets/user_profile/user_8.jpg',
      'about': 'Dream bigger. Do bigger.',
      'selected': false
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
                  .translate('newGroup', 'newGroupString'),
              style: whiteNormalTextStyle,
            ),
            SizedBox(height: 3.0),
            Text(
              AppLocalizations.of(context)!
                  .translate('newGroup', 'addParticipantsString'),
              style: whiteSmallTextStyle,
            )
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selected == 0) {
            Fluttertoast.showToast(
              msg: AppLocalizations.of(context)!
                  .translate('newGroup', 'atleast1ContactSelectedString'),
              backgroundColor: Colors.black,
              textColor: whiteColor,
              gravity: ToastGravity.CENTER,
            );
          } else {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: NewGroupInfo()));
          }
        },
        child: Icon(Icons.arrow_forward),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (selected != 0)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100.0,
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: contactList.length,
                        itemBuilder: (context, index) {
                          final item = contactList[index];
                          return (item['selected'] == true)
                              ? Padding(
                                  padding: (index != contactList.length - 1)
                                      ? EdgeInsets.only(left: fixPadding)
                                      : EdgeInsets.symmetric(
                                          horizontal: fixPadding),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (item['selected'] == true) {
                                          item['selected'] = false;
                                          selected = selected + 1;
                                        } else {
                                          item['selected'] = true;
                                          selected = selected - 1;
                                        }
                                      });
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 50.0,
                                          height: 50.0,
                                          child: Stack(
                                            children: [
                                              Container(
                                                height: 50.0,
                                                width: 50.0,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25.0),
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          '${item['profileImage']}'),
                                                      fit: BoxFit.cover,
                                                    )),
                                              ),
                                              (item['selected'] == true)
                                                  ? Positioned(
                                                      bottom: 0.0,
                                                      right: 0.0,
                                                      child: Container(
                                                        width: 20.0,
                                                        height: 20.0,
                                                        alignment:
                                                            Alignment.center,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          border: Border.all(
                                                              width: 1.5,
                                                              color:
                                                                  whiteColor),
                                                          color: primaryColor,
                                                        ),
                                                        child: Icon(
                                                          Icons.close,
                                                          color: whiteColor,
                                                          size: 14.0,
                                                        ),
                                                      ),
                                                    )
                                                  : Container(),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 5.0),
                                        Text(
                                          '${item['name']}',
                                          style: greySmallTextStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : Container();
                        },
                      ),
                    ),
                    Container(
                      height: 0.7,
                      margin: EdgeInsets.symmetric(horizontal: fixPadding),
                      width: double.infinity,
                      color: Colors.grey[300],
                    ),
                  ],
                )
              : Container(),
          Expanded(
            child: ListView.builder(
              itemCount: contactList.length,
              itemBuilder: (context, index) {
                final item = contactList[index];
                return InkWell(
                  onTap: () {
                    setState(() {
                      if (item['selected'] == true) {
                        item['selected'] = false;
                        selected = selected + 1;
                      } else {
                        item['selected'] = true;
                        selected = selected - 1;
                      }
                    });
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
                          child: Stack(
                            children: [
                              Container(
                                width: 50.0,
                                height: 50.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.0),
                                  image: DecorationImage(
                                    image:
                                        AssetImage('${item['profileImage']}'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              (item['selected'] == true)
                                  ? Positioned(
                                      bottom: 0.0,
                                      right: 0.0,
                                      child: Container(
                                        width: 20.0,
                                        height: 20.0,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                              width: 1.5, color: whiteColor),
                                          color: primaryColor,
                                        ),
                                        child: Icon(
                                          Icons.check,
                                          color: whiteColor,
                                          size: 14.0,
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                        widthSpace,
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${item['name']}',
                                style: blackNormalTextStyle,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                '${item['about']}',
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
          ),
        ],
      ),
    );
  }
}
