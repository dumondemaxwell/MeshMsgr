import 'dart:async';
import 'dart:ui';
import 'package:mesh_msgr/constants/constants.dart';
import 'package:mesh_msgr/functions/localizations.dart';
import 'package:mesh_msgr/pages/bottom_bar.dart';
import 'package:mesh_msgr/pages/chat/full_screen_image.dart';
import 'package:mesh_msgr/pages/chat/profile.dart';
import 'package:mesh_msgr/pages/phone_call.dart';
import 'package:mesh_msgr/pages/video_call.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  final String? name;
  final String? imagePath;
  MessageScreen({super.key, @required this.name, @required this.imagePath});

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final msgController = TextEditingController();
  DateTime now = DateTime.now();
  final ScrollController _scrollController = ScrollController();
  String? amPm;
  final chatData = [
    {
      'role': 'me',
      'msg': '',
      'time': '9:42 AM',
      'read': 'unread',
      'contactName': 'Chris Hemsworth',
      'type': 'contact'
    },
    {
      'role': 'me',
      'msg': 'Wow',
      'time': '9:41 AM',
      'read': 'read',
      'type': 'text'
    },
    {
      'role': 'sender',
      'msg': '',
      'time': '9:40 AM',
      'read': 'read',
      'image': 'assets/image.png',
      'type': 'image'
    },
    {
      'role': 'me',
      'msg': 'I\'m fine. How are you?',
      'time': '9:38 AM',
      'read': 'read',
      'type': 'text'
    },
    {
      'role': 'sender',
      'msg': 'How are you?',
      'time': '9:38 AM',
      'read': 'read',
      'type': 'text'
    },
    {
      'role': 'me',
      'msg': 'Hi',
      'time': '9:36 AM',
      'read': 'read',
      'type': 'text'
    },
    {
      'role': 'sender',
      'msg': 'Hello',
      'time': '9:35 AM',
      'read': 'read',
      'type': 'text'
    },
  ];

  static List<String> choices = <String>['Report', 'Block'];

  @override
  void initState() {
    super.initState();
    _scrollToBottom();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(0.0,
          duration: const Duration(milliseconds: 300), curve: Curves.elasticOut);
    } else {
      Timer(const Duration(milliseconds: 400), () => _scrollToBottom());
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/chat_bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.grey.shade200.withOpacity(0.1),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: whiteColor),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BottomBar()));
                  },
                ),
                titleSpacing: 0.0,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Profile(
                              userName: widget.name!,
                              userImage: widget.imagePath!,
                            ),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 45.0,
                            width: 45.0,
                            alignment: Alignment.topRight,
                            padding: EdgeInsets.all(fixPadding),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22.5),
                              image: DecorationImage(
                                image: AssetImage(widget.imagePath!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          widthSpace,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.name!,
                                style: msgScreenNameTextStyle,
                              ),
                              Text(
                                'Online',
                                style: msgScreenOnlineTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.call, color: whiteColor),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PhoneCall(
                                        name: widget.name!,
                                        imagePath: widget.imagePath!)));
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.videocam, color: whiteColor),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        VideoCall(name: widget.name!)));
                          },
                        ),
                        PopupMenuButton<String>(
                          onSelected: choiceAction,
                          itemBuilder: (BuildContext context) {
                            return choices.map((String choice) {
                              return PopupMenuItem<String>(
                                value: choice,
                                child: Text(choice),
                              );
                            }).toList();
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
              body: body(),
            ),
          ),
        ),
      ],
    );
  }

  body() {
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: chatData.length,
            reverse: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final item = chatData[index];
              return SizedBox(
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: (item['role'] == 'sender')
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  children: <Widget>[
                    Wrap(
                      children: <Widget>[
                        Padding(
                          padding: (item['role'] == 'sender')
                              ? const EdgeInsets.only(right: 100.0)
                              : const EdgeInsets.only(left: 100.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: (item['role'] == 'sender')
                                ? CrossAxisAlignment.start
                                : CrossAxisAlignment.end,
                            children: <Widget>[
                              (item['type'] == 'text')
                                  ? Container(
                                      padding: const EdgeInsets.all(10.0),
                                      margin: const EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: (item['role'] == 'sender')
                                            ? Colors.white
                                            : primaryColor,
                                      ),
                                      child: Text(
                                        item['msg']!,
                                        style: TextStyle(
                                          color: (item['role'] == 'sender')
                                              ? primaryColor
                                              : Colors.white,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    )
                                  : (item['type'] == 'image')
                                      ? InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        FullScreenImage(
                                                          imagePath:
                                                              item['image'],
                                                        )));
                                          },
                                          child: Hero(
                                            tag: item['image']!,
                                            child: Container(
                                              width: 150.0,
                                              height: 150.0,
                                              margin: const EdgeInsets.only(
                                                  left: 10.0, right: 10.0),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                border: Border.all(
                                                    width: 2.0,
                                                    color: whiteColor),
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      item['image']!),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container(
                                          padding: const EdgeInsets.all(10.0),
                                          margin: const EdgeInsets.only(
                                              left: 10.0, right: 10.0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            color: (item['role'] == 'sender')
                                                ? Colors.white
                                                : primaryColor,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                (item['role'] == 'sender')
                                                    ? MainAxisAlignment.start
                                                    : MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(
                                                Icons.group_add,
                                                color:
                                                    (item['role'] == 'sender')
                                                        ? primaryColor
                                                        : Colors.white,
                                              ),
                                              const SizedBox(width: 10.0),
                                              Container(
                                                height: 8.0,
                                                width: 0.7,
                                                color:
                                                    (item['role'] == 'sender')
                                                        ? primaryColor
                                                        : Colors.white,
                                              ),
                                              const SizedBox(width: 10.0),
                                              Text(
                                                item['contactName']!,
                                                style: TextStyle(
                                                  color:
                                                      (item['role'] == 'sender')
                                                          ? primaryColor
                                                          : Colors.white,
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: (item['role'] == 'sender')
                                      ? MainAxisAlignment.start
                                      : MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    (item['role'] == 'sender')
                                        ? Container()
                                        : Icon(
                                            (item['read'] == 'read')
                                                ? Icons.done_all
                                                : Icons.check,
                                            color: Colors.white38,
                                            size: 16.0,
                                          ),
                                    const SizedBox(
                                      width: 7.0,
                                    ),
                                    Text(
                                      item['time']!,
                                      style: const TextStyle(
                                        color: Colors.white38,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Container(
          width: width,
          height: 70.0,
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: width - 120.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white.withOpacity(0.2),
                ),
                child: TextField(
                  controller: msgController,
                  style: const TextStyle(
                    fontSize: 13.0,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!
                        .translate('messageScreen', 'typeAMessage'),
                    hintStyle: const TextStyle(
                      fontSize: 13.0,
                      color: Colors.white60,
                    ),
                    contentPadding: const EdgeInsets.only(left: 10.0),
                    border: InputBorder.none,
                  ),
                ),
              ),
              widthSpace,
              InkWell(
                borderRadius: BorderRadius.circular(20.0),
                onTap: () => _attachBottomSheet(context, width),
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white.withOpacity(0.3),
                  ),
                  child: const Icon(
                    Icons.attach_file,
                    color: Colors.yellow,
                    size: 18.0,
                  ),
                ),
              ),
              widthSpace,
              InkWell(
                borderRadius: BorderRadius.circular(20.0),
                onTap: () {
                  if (msgController.text != '') {
                    if (now.hour > 11) {
                      amPm = 'PM';
                    } else {
                      amPm = 'AM';
                    }
                    setState(() {
                      chatData.insert(0, {
                        'role': 'me',
                        'msg': msgController.text,
                        'time': (now.hour > 12)
                            ? '${now.hour - 12}:${now.minute} $amPm'
                            : '${now.hour}:${now.minute} $amPm',
                        'read': 'unread',
                        'type': 'text'
                      });
                      msgController.text = '';
                      _scrollController.animateTo(
                        0.0,
                        curve: Curves.easeOut,
                        duration: const Duration(milliseconds: 300),
                      );
                    });
                  }
                },
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white.withOpacity(0.3),
                  ),
                  child: const Icon(
                    Icons.send,
                    color: Colors.yellow,
                    size: 18.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Bottom Sheet for Attach Here
  void _attachBottomSheet(context, width) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
        return Container(
          width: width,
          color: Colors.transparent,
          margin: EdgeInsets.all(fixPadding),
          child: Container(
            padding: EdgeInsets.all(fixPadding * 3.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: whiteColor,
            ),
            child: Wrap(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        getAttachTile(
                            Colors.blue,
                            Icon(Icons.note_add, size: 24.0, color: whiteColor),
                            'Document'),
                        getAttachTile(
                            Colors.teal,
                            Icon(Icons.attach_money,
                                size: 24.0, color: whiteColor),
                            'Payment'),
                        getAttachTile(
                            Colors.red,
                            Icon(Icons.photo, size: 24.0, color: whiteColor),
                            'Gallery'),
                      ],
                    ),
                    heightSpace,
                    heightSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        getAttachTile(
                            Colors.purple,
                            Icon(Icons.music_note,
                                size: 24.0, color: whiteColor),
                            'Audio'),
                        getAttachTile(
                            Colors.orange,
                            Icon(Icons.location_on,
                                size: 24.0, color: whiteColor),
                            'Location'),
                        getAttachTile(
                            Colors.indigo,
                            Icon(Icons.person, size: 24.0, color: whiteColor),
                            'Contact'),
                      ],
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
  // Bottom Sheet for Attach Ends Here

  getAttachTile(Color color, Icon icon, String title) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: color,
            ),
            child: icon,
          ),
          heightSpace,
          Text(
            title,
            style: attachBottomSheetTextStyle,
          ),
        ],
      ),
    );
  }

  void choiceAction(String choice) {
    if (choice == 'Report') {
      print('Report');
    } else if (choice == 'Block') {
      print('Block');
    }
  }
}
