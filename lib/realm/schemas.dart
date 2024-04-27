import 'package:realm/realm.dart';
part 'schemas.realm.dart';

@RealmModel()
@MapTo('users')
class _ApplicationUser {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late String linkerId;
  late String username;
  late List<String> groups;
  late List<String> sent;
  late List<String> received;
  late DateTime lastActive;
  late DateTime createdOn;
  late String avatar;
  late bool enableSplash;
  late _ApplicationUserSettings? settings;
}

@RealmModel()
@MapTo('user_settings')
class _ApplicationUserSettings {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late bool isDarkMode = false;
  late bool isNotificationOn = true;
  late bool isSoundOn = true;
  late bool isOnline;
  late bool isSplashOn;
  late bool isLocationOn;
  late DateTime lastModified;
  late DateTime createdOn;

  @Backlink(#settings)
  late Iterable<_ApplicationUser> user;
}

@RealmModel()
@MapTo('messages')
class _ApplicationMessage {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  late String sender;
  late String text;
  late DateTime timestamp;
}

@RealmModel()
@MapTo('groups')
class _ApplicationGroup {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  @MapTo('owner_id')
  late String ownerId;

  late String name;
  late List<String> members;
  late List<_ApplicationMessage> messages;
  late bool isPrivate;
  late bool isFavorite;
  late DateTime lastModified;
  late DateTime createdOn;
}

@RealmModel()
@MapTo('calls')
class _ApplicationCall {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  late String caller;
  late String receiver;
  late DateTime timestamp;
  late bool isVideoCall;
  late bool isMissed;
}

/*
* used to generate realm schema
* */
// generator: flutter pub run realm generate