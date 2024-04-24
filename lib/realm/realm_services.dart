import 'package:flutter/material.dart';
import 'package:mesh_msgr/realm/schemas.dart';
import 'package:realm/realm.dart';

class RealmServices extends ChangeNotifier {
  static const getMyGroupsSubscription = "getMyGroupsSubscription";
  static const getAllGroupsSubscription = "getAllGroupsSubscription";

  bool offlineModeOn = false;
  bool isWaiting = false;

  late Realm _realm;
  User? currentUser;
  App app;

  RealmServices(this.app) {
    if (app.currentUser != null || currentUser != app.currentUser) {
      currentUser ??= app.currentUser;
      _realm = Realm(Configuration.flexibleSync(currentUser!, [
        ApplicationUser.schema,
        ApplicationGroup.schema,
        ApplicationMessage.schema
      ]));
      if (_realm.subscriptions.isEmpty) {
        updateSubscriptions();
      }
    }
  }

  Future<void> updateSubscriptions() async {
    _realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.clear();
      mutableSubscriptions.add(_realm.all<ApplicationGroup>(), name: getAllGroupsSubscription);
      mutableSubscriptions.add(_realm.query<ApplicationGroup>(r'owner_id == $0', [currentUser?.id]), name: getMyGroupsSubscription);
    });
    await _realm.subscriptions.waitForSynchronization();
  }

  Future<void> sessionSwitch() async {
    offlineModeOn = !offlineModeOn;
    if (offlineModeOn) {
      _realm.syncSession.pause();
    } else {
      try {
        isWaiting = true;
        notifyListeners();
        _realm.syncSession.resume();
        await updateSubscriptions();
      } finally {
        isWaiting = false;
      }
    }
    notifyListeners();
  }

  // create new group
  Future<void> createGroup(String name, List<ApplicationUser> members, bool isPrivate, bool isFavorite) async {
    await _realm.writeAsync(() {
      var id = ObjectId();
      var stamp = DateTime.now();
      var ownerId = currentUser!.id;
      var group  = ApplicationGroup(id, ownerId, name, isPrivate, isFavorite, stamp, stamp);
      _realm.add(group);
    });
  }

  // update group if the group is owned by logged in user
  Future<void> updateGroup(ApplicationGroup group) async {
    if (group.ownerId == currentUser!.id) {
      await _realm.writeAsync(() {
        group.lastModified = DateTime.now();
      });
    }
    notifyListeners();
  }

  // delete group if the group is owned by logged in user
  Future<void> deleteGroup(ApplicationGroup group) async {
    if (group.ownerId == currentUser!.id) {
      await _realm.writeAsync(() {
        _realm.delete(group);
      });
    }
    notifyListeners();
  }


  // create new message
  Future<void> createMessage(ApplicationGroup group, String text) async {
    await _realm.writeAsync(() {
      var id = ObjectId();
      var sender = currentUser?.id ?? 'Anonymous';
      var timestamp = DateTime.now();
      var message = ApplicationMessage(id, sender, text, timestamp);
      var insertedMsg = _realm.add(message);
      group.messages.add(insertedMsg);
    });
    notifyListeners();
  }

  // update message if the message is sent by logged in user
  Future<void> updateMessage(ApplicationMessage message) async {
    if (message.sender == currentUser!.id) {
      await _realm.writeAsync(() {
        message.timestamp = DateTime.now();
      });
    }
    notifyListeners();
  }

  // delete message if the message is sent by logged in user
  Future<void> deleteMessage(ApplicationMessage message) async {
    if (message.sender == currentUser!.id) {
      await _realm.writeAsync(() {
        _realm.delete(message);
      });
    }
    notifyListeners();
  }
}