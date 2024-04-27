import 'package:flutter/material.dart';
import 'package:mesh_msgr/realm/schemas.dart';
import 'package:realm/realm.dart';

class RealmServices extends ChangeNotifier {
  static const getMyCreatedGroupsSubscription = "getMyCreatedGroupsSubscription";
  static const getMyGroupsSubscription = "getMyGroupsSubscription";
  static const getMyCallsSubscription = "getMyCallsSubscription";
  static const getUserUpdateSubscription = "getUserUpdateSubscription";
  static const getAllUserSettingsSubscription = "getAllUserSettingsSubscription";
  static const getMyUserSettingsSubscription = "getMyUserSettingsSubscription";

  bool offlineModeOn = false;
  bool isWaiting = false;

  late Realm realmInstance;
  User? currentUser;
  App app;

  RealmServices(this.app) {
    print("RealmServices constructor");
    if (app.currentUser != null || currentUser != app.currentUser) {
      currentUser ??= app.currentUser;
      realmInstance = Realm(Configuration.flexibleSync(currentUser!, [
        ApplicationUser.schema,
        ApplicationUserSettings.schema,
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
      mutableSubscriptions.add(realmInstance.query<ApplicationUser>(r'_id == $0', [ObjectId.fromHexString(currentUser!.id)]), name: getUserUpdateSubscription);
      mutableSubscriptions.add(realmInstance.all<ApplicationUserSettings>(), name: getAllUserSettingsSubscription);
      mutableSubscriptions.add(realmInstance.all<ApplicationUser>(), name: 'allUsers');
    });
    await realmInstance.subscriptions.waitForSynchronization();
  }

  ApplicationUser getUserByTokenId(String tokenId) {
    return realmInstance.query<ApplicationUser>(r'id== $0', [tokenId]).first;
  }

  Future<ApplicationUser> getUserByToken(String token) async {
    return realmInstance.query<ApplicationUser>(r'username == $0 OR id == $0', [token]).first;
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

  Future<void> createCall(String receiver, bool isVideoCall) async {
    await realmInstance.writeAsync(() {
      var id = ObjectId();
      var caller = currentUser!.id;
      var timestamp = DateTime.now();
      var call = ApplicationCall(id, caller, receiver, timestamp, isVideoCall, false);
      realmInstance.add(call);
    });
    notifyListeners();
  }

  Future<void> updateCall(ApplicationCall call, {bool? isMissed}) async {
    if (call.caller == currentUser!.id) {
      await realmInstance.writeAsync(() {
        if (isMissed != null) {
          call.isMissed = isMissed;
        }
      });
    }
    notifyListeners();
  }

  Future<void> deleteCall(ApplicationCall call) async {
    if (call.caller == currentUser!.id) {
      await realmInstance.writeAsync(() {
        realmInstance.delete(call);
      });
    }
    notifyListeners();
  }

  Future<void> close() async {
    if (currentUser != null) {
      await currentUser?.logOut();
      currentUser = null;
    }
    realmInstance.close();
  }

  Future<void> addOrUpdateUser(ApplicationUser user, ApplicationUserSettings settings) async {
    await realmInstance.writeAsync(() {
      realmInstance.add(user, update: true);
      realmInstance.add(settings, update: true);
    });
    await realmInstance.subscriptions.waitForSynchronization();
    notifyListeners();
  }
}