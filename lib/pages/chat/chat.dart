import 'package:mesh_msgr/constants/constants.dart';
import 'package:mesh_msgr/functions/localizations.dart';
import 'package:mesh_msgr/pages/chat/message_screen.dart';
import 'package:mesh_msgr/pages/chat/profile.dart';
import 'package:mesh_msgr/pages/chat/select_contact.dart';
import 'package:mesh_msgr/pages/phone_call.dart';
import 'package:mesh_msgr/pages/video_call.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final chatList = [
    {
      'name': 'Ronan',
      'image': 'assets/user_profile/user_1.jpg',
      'time': '5m',
      'msg': 'Hello',
      'msgNumber': '3',
      'type': 'msg'
    },
    {
      'name': 'Brayden',
      'image': 'assets/user_profile/user_2.jpg',
      'time': '14m',
      'msg': 'Hello',
      'msgNumber': '8',
      'type': 'file'
    },
    {
      'name': 'Apollonia',
      'image': 'assets/user_profile/user_3.jpg',
      'time': '20m',
      'msg': 'Hello',
      'msgNumber': '0',
      'type': 'contact'
    },
    {
      'name': 'Beatriz',
      'image': 'assets/user_profile/user_4.jpg',
      'time': '1d',
      'msg': 'Hello',
      'msgNumber': '6',
      'type': 'msg'
    },
    {
      'name': 'Shira',
      'image': 'assets/user_profile/user_5.jpg',
      'time': '2d',
      'msg': 'Hello',
      'msgNumber': '0',
      'type': 'file'
    },
    {
      'name': 'Diego',
      'image': 'assets/user_profile/user_6.jpg',
      'time': '2d',
      'msg': 'Hello',
      'msgNumber': '0',
      'type': 'contact'
    },
    {
      'name': 'Marco',
      'image': 'assets/user_profile/user_7.jpg',
      'time': '2d',
      'msg': 'Hello',
      'msgNumber': '0',
      'type': 'file'
    },
    {
      'name': 'Steffan',
      'image': 'assets/user_profile/user_8.jpg',
      'time': '2d',
      'msg': 'Hello',
      'msgNumber': '2',
      'type': 'contact'
    }
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    showProfileImage(String name, String imagePath) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return Hero(
            tag: imagePath,
            child: Dialog(
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              child: Wrap(
                children: <Widget>[
                  Column(
                    children: [
                      Stack(
                        children: <Widget>[
                          Container(
                            width: width,
                            height: 220.0,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(5.0),
                                topLeft: Radius.circular(5.0),
                              ),
                              image: DecorationImage(
                                  image: AssetImage(imagePath),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Positioned(
                            top: 0.0,
                            child: Container(
                              width: width,
                              height: 30.0,
                              padding: EdgeInsets.only(left: fixPadding),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(5.0),
                                  topLeft: Radius.circular(5.0),
                                ),
                                color: blackColor.withOpacity(0.6),
                              ),
                              child: Text(
                                name,
                                style: appBarTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(fixPadding),
                        width: width,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.chat,
                                  color: primaryColor, size: 18.0),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MessageScreen(
                                            name: name, imagePath: imagePath)));
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.call,
                                  color: primaryColor, size: 18.0),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PhoneCall(
                                            name: name, imagePath: imagePath)));
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.videocam,
                                  color: primaryColor, size: 18.0),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            VideoCall(name: name)));
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.info_outline,
                                  color: primaryColor, size: 18.0),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Profile(
                                      userName: name,
                                      userImage: imagePath,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: Text(
          AppLocalizations.of(context)!.translate('chat', 'chatString'),
          style: appBarTextStyle,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: whiteColor),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.message_outlined,
          color: whiteColor,
        ),
        onPressed: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: SelectContact()));
        },
      ),
      body: ListView.builder(
        itemCount: chatList.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final item = chatList[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MessageScreen(
                          name: item['name']!, imagePath: item['image']!)));
            },
            child: Container(
              width: width,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(fixPadding),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Hero(
                          tag: item['image']!,
                          child: InkWell(
                            onTap: () {
                              showProfileImage(item['name']!, item['image']!);
                            },
                            child: Container(
                              height: 60.0,
                              width: 60.0,
                              alignment: Alignment.topRight,
                              padding: EdgeInsets.all(fixPadding),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                image: DecorationImage(
                                  image: AssetImage(item['image']!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: width - ((fixPadding * 2) + 60.0 + 30.0),
                          padding: EdgeInsets.all(fixPadding),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    item['name']!,
                                    style: nemeTextStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  widthSpace,
                                  Text(
                                    item['time']!,
                                    style: timeTextStyle,
                                  ),
                                ],
                              ),
                              heightSpace,
                              (item['type'] == 'msg')
                                  ? Text(
                                      item['msg']!,
                                      style: msgTextStyle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  : (item['type'] == 'file')
                                      ? Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.attach_file,
                                              color: greyColor,
                                              size: 16.0,
                                            ),
                                            const SizedBox(width: 3.0),
                                            Text(
                                              AppLocalizations.of(context)!
                                                  .translate('chat',
                                                      'youShareAFileString'),
                                              style: msgTextStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            )
                                          ],
                                        )
                                      : Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.contacts,
                                              color: greyColor,
                                              size: 16.0,
                                            ),
                                            const SizedBox(width: 3.0),
                                            Text(
                                              AppLocalizations.of(context)!
                                                  .translate('chat',
                                                      'youShareAContactString'),
                                              style: msgTextStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            )
                                          ],
                                        ),
                            ],
                          ),
                        ),
                        (item['msgNumber'] != '0')
                            ? Container(
                                height: 20.0,
                                width: 20.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Text(
                                  item['msgNumber']!,
                                  style: badgeTextStyle,
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  (index != (chatList.length - 1))
                      ? Container(
                          width: width - (fixPadding * 2.0),
                          height: 0.6,
                          color: primaryColor.withOpacity(0.20),
                        )
                      : Container(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
