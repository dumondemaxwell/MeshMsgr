import 'package:flutter/material.dart';
import 'package:mesh_msgr/realm/schemas.dart';
import 'package:realm/realm.dart';

class RealmServices extends ChangeNotifier {
  static const getMyCreatedGroupsSubscription = "getMyCreatedGroupsSubscription";
  static const getMyGroupsSubscription = "getMyGroupsSubscription";
  static const getMyCallsSubscription = "getMyCallsSubscription";

  bool offlineModeOn = false;
  bool isWaiting = false;

  late Realm realmInstance;
  User? currentUser;
  App app;

  RealmServices(this.app) {
    if (app.currentUser != null || currentUser != app.currentUser) {
      currentUser ??= app.currentUser;
      realmInstance = Realm(Configuration.flexibleSync(currentUser!, [
        ApplicationUser.schema,
        ApplicationGroup.schema,
        ApplicationMessage.schema,
        ApplicationCall.schema
      ]));
      if (realmInstance.subscriptions.isEmpty) {
        updateSubscriptions();
      }
    }
  }

  Future<void> logOut() async {
    await currentUser?.logOut();
    currentUser = null;
  }

  Future<void> updateSubscriptions() async {
    realmInstance.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.clear();
      mutableSubscriptions.add(realmInstance.query<ApplicationGroup>(r'owner_id == $0', [currentUser?.id]), name: getMyCreatedGroupsSubscription);
      mutableSubscriptions.add(realmInstance.query<ApplicationGroup>(r'members CONTAINS $0', [currentUser?.id]), name: getMyGroupsSubscription);
      mutableSubscriptions.add(realmInstance.query<ApplicationCall>(r'caller == $0 OR receiver == $0', [currentUser?.id]), name: getMyCallsSubscription);
    });
    await realmInstance.subscriptions.waitForSynchronization();
  }

  Future<void> sessionSwitch() async {
    offlineModeOn = !offlineModeOn;
    if (offlineModeOn) {
      realmInstance.syncSession.pause();
    } else {
      try {
        isWaiting = true;
        notifyListeners();
        realmInstance.syncSession.resume();
        await updateSubscriptions();
      } finally {
        isWaiting = false;
      }
    }
    notifyListeners();
  }

  // create new group
  Future<void> createGroup(String name, List<ApplicationUser> members, bool isPrivate, bool isFavorite) async {
    await realmInstance.writeAsync(() {
      var id = ObjectId();
      var stamp = DateTime.now();
      var ownerId = currentUser!.id;
      var group  = ApplicationGroup(id, ownerId, name, isPrivate, isFavorite, stamp, stamp);
      realmInstance.add(group);
    });
  }

  // update group if the group is owned by logged in user
  Future<void> updateGroup(ApplicationGroup group) async {
    if (group.ownerId == currentUser!.id) {
      await realmInstance.writeAsync(() {
        group.lastModified = DateTime.now();
      });
    }
    notifyListeners();
  }

  // delete group if the group is owned by logged in user
  Future<void> deleteGroup(ApplicationGroup group) async {
    if (group.ownerId == currentUser!.id) {
      await realmInstance.writeAsync(() {
        realmInstance.delete(group);
      });
    }
    notifyListeners();
  }


  // create new message
  Future<void> createMessage(ApplicationGroup group, String text) async {
    await realmInstance.writeAsync(() {
      var id = ObjectId();
      var sender = currentUser?.id ?? 'Anonymous';
      var timestamp = DateTime.now();
      var message = ApplicationMessage(id, sender, text, timestamp);
      var insertedMsg = realmInstance.add(message);
      group.messages.add(insertedMsg);
    });
    notifyListeners();
  }

  // update message if the message is sent by logged in user
  Future<void> updateMessage(ApplicationMessage message) async {
    if (message.sender == currentUser!.id) {
      await realmInstance.writeAsync(() {
        message.timestamp = DateTime.now();
      });
    }
    notifyListeners();
  }

  // delete message if the message is sent by logged in user
  Future<void> deleteMessage(ApplicationMessage message) async {
    if (message.sender == currentUser!.id) {
      await realmInstance.writeAsync(() {
        realmInstance.delete(message);
      });
    }
    notifyListeners();
  }
}