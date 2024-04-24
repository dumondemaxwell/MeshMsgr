import 'package:realm/realm.dart';
part 'schemas.realm.dart';

@RealmModel()
class _ApplicationUser {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  late String username;
  late String email;
  late String phone;
  late List<_ApplicationGroup> groups;
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

/*
* used to generate realm schema
* */
// generator: flutter pub run realm generate