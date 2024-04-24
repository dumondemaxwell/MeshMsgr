import 'package:realm/realm.dart';
part 'schemas.realm.dart';

@RealmModel()
class _ApplicationUser {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late String username;
  late List<String> groups;
  late DateTime lastActive;
  late DateTime createdOn;
  late bool isOnline;
}

@RealmModel()
class _ApplicationMessage {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  late String sender;
  late String text;
  late DateTime timestamp;
}

@RealmModel()
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