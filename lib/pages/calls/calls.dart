import 'package:mesh_msgr/constants/constants.dart';
import 'package:mesh_msgr/pages/phone_call.dart';
import 'package:mesh_msgr/pages/video_call.dart';
import 'package:flutter/material.dart';
import 'package:mesh_msgr/realm/app_services.dart';
import 'package:mesh_msgr/realm/realm_services.dart';
import 'package:mesh_msgr/realm/schemas.dart';
import 'package:mesh_msgr/services/endpoints.dart';
import 'package:page_transition/page_transition.dart';
import 'package:mesh_msgr/pages/chat/select_contact.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';

class Calls extends StatefulWidget {
  const Calls({super.key});

  @override
  State<Calls> createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  final callAndMessageService = EndpointStorageService();

  @override
  Widget build(BuildContext context) {
    final realmServices = Provider.of<RealmServices>(context);
    final appServices = Provider.of<AppServices>(context);
    final GlobalKey<ScaffoldState> key = GlobalKey(); // Create a key
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: key,
      appBar: AppBar(
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: Text(
          'Calls',
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
            onPressed: () {
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
              itemCount: callAndMessageService.endpoints.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final item = callAndMessageService.endpoints[index];
                return ListTile(
                  title: Text(item.name),
                  onTap: () => callAndMessageService.current = item,
                );
              },
            ),
          )
      ),
      body: StreamBuilder<RealmResultsChanges<ApplicationCall>>(
        stream: realmServices.realmInstance.query<ApplicationCall>(r"caller == $0 OR receiver == $0 SORT(timestamp DESC)", [appServices.currentUser?.id]).changes,
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (data == null) {
            return const Center(child: CircularProgressIndicator());
          }

          if(data.results.isEmpty){
            return const Center(child: Text('No calls'));
          }

          return ListView.builder(
            itemCount: data.results.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final item = data.results[index];
              return Container(
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
                          Container(
                            height: 60.0,
                            width: 60.0,
                            alignment: Alignment.topRight,
                            padding: EdgeInsets.all(fixPadding),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              image: const DecorationImage(
                                image: AssetImage('assets/user.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: width - ((fixPadding * 2) + 60.0 + 50.0),
                            padding: EdgeInsets.all(fixPadding),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // Text(
                                //   item.receiver,
                                //   style: nemeTextStyle,
                                //   maxLines: 1,
                                //   overflow: TextOverflow.ellipsis,
                                // ),
                                heightSpace,
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.start,
                                //   crossAxisAlignment: CrossAxisAlignment.center,
                                //   children: [
                                //     (item['callStatus'] == 'dial')
                                //         ? const Icon(Icons.call_made,
                                //             color: Colors.blue, size: 16.0)
                                //         : (item['callStatus'] == 'received')
                                //             ? const Icon(Icons.call_received,
                                //                 color: Colors.orange, size: 16.0)
                                //             : const Icon(Icons.call_missed,
                                //                 color: Colors.red, size: 16.0),
                                //     widthSpace,
                                //     Text(item['time']!, style: msgTextStyle),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                          // IconButton(
                          //   onPressed: () {
                          //     if (item['type'] == 'voice') {
                          //       Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //               builder: (context) => PhoneCall(
                          //                   name: item['name']!,
                          //                   imagePath: item['image']!)));
                          //     } else {
                          //       Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //               builder: (context) =>
                          //                   VideoCall(name: item['name']!)));
                          //     }
                          //   },
                          //   icon: Icon(
                          //       (item['type'] == 'voice')
                          //           ? Icons.call
                          //           : Icons.videocam,
                          //       color: primaryColor,
                          //       size: 18.0),
                          // ),
                        ],
                      ),
                    ),
                    // (index != (callList.length - 1))
                    //     ? Container(
                    //         width: width - (fixPadding * 2.0),
                    //         height: 0.6,
                    //         color: primaryColor.withOpacity(0.20),
                    //       )
                    //     : Container(),
                  ],
                ),
              );
            },
          );
        }
        ));
  }
}
