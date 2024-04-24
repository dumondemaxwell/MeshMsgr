import 'package:mesh_msgr/constants/constants.dart';
import 'package:mesh_msgr/functions/localizations.dart';
import 'package:mesh_msgr/pages/chat/message_screen.dart';
import 'package:mesh_msgr/pages/chat/profile.dart';
import 'package:mesh_msgr/pages/chat/select_contact.dart';
import 'package:mesh_msgr/pages/phone_call.dart';
import 'package:mesh_msgr/pages/video_call.dart';
import 'package:flutter/material.dart';
import 'package:mesh_msgr/services/mongo.dart';
import 'package:page_transition/page_transition.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final endpoint_groups = [
    {
      'name': 'Infura1',
      'endpoint': 'https://mainnet.infura.io/v3/your_project_id'
    },
    {
      'name': 'Infura2',
      'endpoint': 'https://mainnet.infura.io/v3/your_project_id'
    }
  ];

  @override
  Widget build(BuildContext context) {
    final mongoDbService =  DatabaseProxyService();
    final GlobalKey<ScaffoldState> key = GlobalKey(); // Create a key
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
                                // Navigator.pop(context);
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => MessageScreen(
                                //             name: name, imagePath: imagePath)));
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

    getMongoDbServiceFutureBuilder() {
      return FutureBuilder(
        future: mongoDbService.getMessagesAndGroupsForUser('test user'),
        builder: (BuildContext context, AsyncSnapshot<List<MongoGroupModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: snapshot.requireData.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                var item = snapshot.data![index];
                if(item.members.isEmpty){
                  return Container();
                }

                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MessageScreen(group: item)));
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
                                tag: item.image,
                                child: InkWell(
                                  onTap: () {
                                    showProfileImage(item.name ?? '', item.image ?? '');
                                  },
                                  child: Container(
                                    height: 60.0,
                                    width: 60.0,
                                    alignment: Alignment.topRight,
                                    padding: EdgeInsets.all(fixPadding),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      image: DecorationImage(
                                        image: AssetImage(item.image.startsWith('data:image') ? item.image : 'assets/default_room_no_image.png'),
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
                                          item.name,
                                          style: nemeTextStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        widthSpace,
                                        Text(
                                          item.updatedAt.toString(),
                                          style: timeTextStyle,
                                        ),
                                      ],
                                    ),
                                    heightSpace,
                                    Text(item.messages.isNotEmpty? item.messages.last.message : 'No Conversation' , style: msgTextStyle, maxLines: 1, overflow: TextOverflow.ellipsis),
                                  ],
                                ),
                              ),
                              (item.messages.isNotEmpty)
                                  ? Container(
                                height: 20.0,
                                width: 20.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Text(
                                  item.messages.last.message,
                                  style: badgeTextStyle,
                                ),
                              )
                                  : Container(),
                            ],
                          ),
                        ),
                        // (index != ((snapshot.data?.length ?? 0) - 1))
                        //     ? Container(
                        //   width: width - (fixPadding * 2.0),
                        //   height: 0.6,
                        //   color: primaryColor.withOpacity(0.20),
                        // )
                        //     : Container(),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Scaffold(
              body: CircularProgressIndicator(),
            );
          }
        }
      );
    }

    Scaffold getScaffold(){
      return Scaffold(
        key: key,
        appBar: AppBar(
          backgroundColor: primaryColor,
          automaticallyImplyLeading: false,
          title: Text(
            AppLocalizations.of(context)!.translate('chat', 'chatString'),
            style: appBarTextStyle,
          ),
          leading: IconButton(
            icon: Icon(Icons.menu, color: whiteColor),
            onPressed: () {
              key.currentState!.openDrawer();
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.add, color: whiteColor),
              onPressed: () async {
                // await mongoDbService.addGroup(Group(id: 'id', name: 'name', image: 'image', members: [
                //   'test_user',
                // ], messages: []));
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: const SelectContact()));
              },
            ),
          ],
        ),
        drawer: Drawer(
            child: SizedBox(
              child: ListView.builder(
                itemCount: endpoint_groups.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = endpoint_groups[index];
                  return ListTile(
                    title: Text(item['name']!),
                    onTap: () {
                      // todo: change context of chat
                    },
                  );
                },
              ),
            )
        ),
        body: getMongoDbServiceFutureBuilder()
      );
    }

    return getScaffold();
  }
}
