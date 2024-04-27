import 'package:mesh_msgr/constants/constants.dart';
import 'package:mesh_msgr/functions/localizations.dart';
import 'package:mesh_msgr/pages/chat/message_screen.dart';
import 'package:mesh_msgr/pages/groups/new_group.dart';
import 'package:flutter/material.dart';
import 'package:mesh_msgr/realm/app_services.dart';
import 'package:mesh_msgr/realm/realm_services.dart';
import 'package:mesh_msgr/realm/schemas.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({super.key});

  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {

  @override
  Widget build(BuildContext context) {
    final realmServices = Provider.of<RealmServices>(context);
    final appServices = Provider.of<AppServices>(context);

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
      body: StreamBuilder<RealmResultsChanges<ApplicationUser>>(
        stream: realmServices.realmInstance.query<ApplicationUser>("").changes,
        builder: (context, snapshot) {
          final data = snapshot.data;

          if (snapshot.hasData) {
            final contacts = data?.results;
            if(contacts == null) return const Center(child: Text('No contacts found'));
            return ListView.builder(
              itemCount: data?.results.length ?? 0,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     PageTransition(
                    //         type: PageTransitionType.rightToLeft,
                    //         child: MessageScreen(
                    //           name: contact.name,
                    //           imagePath: contact.profileImage,
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
                              image: AssetImage(contact.avatar),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                contact.username,
                                style: blackNormalTextStyle,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 5.0),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      )
      // body: ListView.builder(
      //   itemCount: contactList.length,
      //   itemBuilder: (context, index) {
      //     final item = contactList[index];
      //
      //     return (index == 0)
      //         ? Column(
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               InkWell(
      //                 onTap: () {
      //                   Navigator.push(
      //                       context,
      //                       PageTransition(
      //                           type: PageTransitionType.rightToLeft,
      //                           child: NewGroup()));
      //                 },
      //                 child: Container(
      //                   padding: EdgeInsets.all(fixPadding),
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.start,
      //                     crossAxisAlignment: CrossAxisAlignment.center,
      //                     children: [
      //                       Container(
      //                         width: 50.0,
      //                         height: 50.0,
      //                         alignment: Alignment.center,
      //                         decoration: BoxDecoration(
      //                           borderRadius: BorderRadius.circular(25.0),
      //                           color: primaryColor,
      //                         ),
      //                         child: Icon(
      //                           Icons.group,
      //                           color: whiteColor,
      //                           size: 20.0,
      //                         ),
      //                       ),
      //                       widthSpace,
      //                       Expanded(
      //                         child: Text(
      //                           AppLocalizations.of(context)!.translate(
      //                               'selectContact', 'newGroupString'),
      //                           style: blackNormalTextStyle,
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //               InkWell(
      //                 onTap: () {
      //                   // Navigator.push(
      //                   //     context,
      //                   //     PageTransition(
      //                   //         type: PageTransitionType.rightToLeft,
      //                   //         child: MessageScreen(
      //                   //           name: item['name'],
      //                   //           imagePath: item['profileImage'],
      //                   //         )));
      //                 },
      //                 child: Container(
      //                   padding: EdgeInsets.all(fixPadding),
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.start,
      //                     crossAxisAlignment: CrossAxisAlignment.center,
      //                     children: [
      //                       Container(
      //                         width: 50.0,
      //                         height: 50.0,
      //                         alignment: Alignment.center,
      //                         decoration: BoxDecoration(
      //                           borderRadius: BorderRadius.circular(25.0),
      //                           image: DecorationImage(
      //                             image: AssetImage(item['profileImage']!),
      //                             fit: BoxFit.cover,
      //                           ),
      //                         ),
      //                       ),
      //                       widthSpace,
      //                       Expanded(
      //                         child: Column(
      //                           mainAxisAlignment: MainAxisAlignment.center,
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Text(
      //                               item['name']!,
      //                               style: blackNormalTextStyle,
      //                               overflow: TextOverflow.ellipsis,
      //                             ),
      //                             const SizedBox(height: 5.0),
      //                             Text(
      //                               item['about']!,
      //                               style: greySmallTextStyle,
      //                               overflow: TextOverflow.ellipsis,
      //                             ),
      //                           ],
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           )
      //         : (index == (contactList.length - 1))
      //             ? Column(
      //                 mainAxisAlignment: MainAxisAlignment.start,
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   InkWell(
      //                     onTap: () {
      //                       // Navigator.push(
      //                       //     context,
      //                       //     PageTransition(
      //                       //         type: PageTransitionType.rightToLeft,
      //                       //         child: MessageScreen(
      //                       //           name: item['name'],
      //                       //           imagePath: item['profileImage'],
      //                       //         )));
      //                     },
      //                     child: Container(
      //                       padding: EdgeInsets.all(fixPadding),
      //                       child: Row(
      //                         mainAxisAlignment: MainAxisAlignment.start,
      //                         crossAxisAlignment: CrossAxisAlignment.center,
      //                         children: [
      //                           Container(
      //                             width: 50.0,
      //                             height: 50.0,
      //                             alignment: Alignment.center,
      //                             decoration: BoxDecoration(
      //                               borderRadius: BorderRadius.circular(25.0),
      //                               image: DecorationImage(
      //                                 image: AssetImage(item['profileImage']!),
      //                                 fit: BoxFit.cover,
      //                               ),
      //                             ),
      //                           ),
      //                           widthSpace,
      //                           Expanded(
      //                             child: Column(
      //                               mainAxisAlignment: MainAxisAlignment.center,
      //                               crossAxisAlignment:
      //                                   CrossAxisAlignment.start,
      //                               children: [
      //                                 Text(
      //                                   item['name']!,
      //                                   style: blackNormalTextStyle,
      //                                   overflow: TextOverflow.ellipsis,
      //                                 ),
      //                                 const SizedBox(height: 5.0),
      //                                 Text(
      //                                   item['about']!,
      //                                   style: greySmallTextStyle,
      //                                   overflow: TextOverflow.ellipsis,
      //                                 ),
      //                               ],
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                   ),
      //                   // Container(
      //                   //   padding: EdgeInsets.all(fixPadding),
      //                   //   child: Row(
      //                   //     mainAxisAlignment: MainAxisAlignment.start,
      //                   //     crossAxisAlignment: CrossAxisAlignment.center,
      //                   //     children: [
      //                   //       Container(
      //                   //         width: 50.0,
      //                   //         height: 50.0,
      //                   //         alignment: Alignment.center,
      //                   //         decoration: BoxDecoration(
      //                   //           borderRadius: BorderRadius.circular(25.0),
      //                   //         ),
      //                   //         child: Icon(
      //                   //           Icons.share,
      //                   //           color: blackColor,
      //                   //           size: 20.0,
      //                   //         ),
      //                   //       ),
      //                   //       widthSpace,
      //                   //       Expanded(
      //                   //         child: Text(
      //                   //           AppLocalizations.of(context)!.translate(
      //                   //               'selectContact', 'inviteFriendsString'),
      //                   //           style: blackNormalTextStyle,
      //                   //         ),
      //                   //       ),
      //                   //     ],
      //                   //   ),
      //                   // ),
      //                 ],
      //               )
      //             : InkWell(
      //                 onTap: () {
      //                   // Navigator.push(
      //                   //     context,
      //                   //     PageTransition(
      //                   //         type: PageTransitionType.rightToLeft,
      //                   //         child: MessageScreen(
      //                   //           name: item['name'],
      //                   //           imagePath: item['profileImage'],
      //                   //         )));
      //                 },
      //                 child: Container(
      //                   padding: EdgeInsets.all(fixPadding),
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.start,
      //                     crossAxisAlignment: CrossAxisAlignment.center,
      //                     children: [
      //                       Container(
      //                         width: 50.0,
      //                         height: 50.0,
      //                         alignment: Alignment.center,
      //                         decoration: BoxDecoration(
      //                           borderRadius: BorderRadius.circular(25.0),
      //                           image: DecorationImage(
      //                             image: AssetImage(item['profileImage']!),
      //                             fit: BoxFit.cover,
      //                           ),
      //                         ),
      //                       ),
      //                       widthSpace,
      //                       Expanded(
      //                         child: Column(
      //                           mainAxisAlignment: MainAxisAlignment.center,
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Text(
      //                               item['name']!,
      //                               style: blackNormalTextStyle,
      //                               overflow: TextOverflow.ellipsis,
      //                             ),
      //                             const SizedBox(height: 5.0),
      //                             Text(
      //                               item['about']!,
      //                               style: greySmallTextStyle,
      //                               overflow: TextOverflow.ellipsis,
      //                             ),
      //                           ],
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               );
      //   },
      // ),
    );
  }
}
