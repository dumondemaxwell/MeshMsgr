// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schemas.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ApplicationUser extends _ApplicationUser
    with RealmEntity, RealmObjectBase, RealmObject {
  ApplicationUser(
    ObjectId id,
    String username,
    String email,
    String phone, {
    Iterable<ApplicationGroup> groups = const [],
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'username', username);
    RealmObjectBase.set(this, 'email', email);
    RealmObjectBase.set(this, 'phone', phone);
    RealmObjectBase.set<RealmList<ApplicationGroup>>(
        this, 'groups', RealmList<ApplicationGroup>(groups));
  }

  ApplicationUser._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get username =>
      RealmObjectBase.get<String>(this, 'username') as String;
  @override
  set username(String value) => RealmObjectBase.set(this, 'username', value);

  @override
  String get email => RealmObjectBase.get<String>(this, 'email') as String;
  @override
  set email(String value) => RealmObjectBase.set(this, 'email', value);

  @override
  String get phone => RealmObjectBase.get<String>(this, 'phone') as String;
  @override
  set phone(String value) => RealmObjectBase.set(this, 'phone', value);

  @override
  RealmList<ApplicationGroup> get groups =>
      RealmObjectBase.get<ApplicationGroup>(this, 'groups')
          as RealmList<ApplicationGroup>;
  @override
  set groups(covariant RealmList<ApplicationGroup> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<ApplicationUser>> get changes =>
      RealmObjectBase.getChanges<ApplicationUser>(this);

  @override
  ApplicationUser freeze() =>
      RealmObjectBase.freezeObject<ApplicationUser>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'username': username.toEJson(),
      'email': email.toEJson(),
      'phone': phone.toEJson(),
      'groups': groups.toEJson(),
    };
  }

  static EJsonValue _toEJson(ApplicationUser value) => value.toEJson();
  static ApplicationUser _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'username': EJsonValue username,
        'email': EJsonValue email,
        'phone': EJsonValue phone,
        'groups': EJsonValue groups,
      } =>
        ApplicationUser(
          fromEJson(id),
          fromEJson(username),
          fromEJson(email),
          fromEJson(phone),
          groups: fromEJson(groups),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(ApplicationUser._);
    register(_toEJson, _fromEJson);
    return SchemaObject(
        ObjectType.realmObject, ApplicationUser, 'ApplicationUser', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('username', RealmPropertyType.string),
      SchemaProperty('email', RealmPropertyType.string),
      SchemaProperty('phone', RealmPropertyType.string),
      SchemaProperty('groups', RealmPropertyType.object,
          linkTarget: 'ApplicationGroup',
          collectionType: RealmCollectionType.list),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class ApplicationMessage extends _ApplicationMessage
    with RealmEntity, RealmObjectBase, RealmObject {
  ApplicationMessage(
    ObjectId id,
    String sender,
    String text,
    DateTime timestamp,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'sender', sender);
    RealmObjectBase.set(this, 'text', text);
    RealmObjectBase.set(this, 'timestamp', timestamp);
  }

  ApplicationMessage._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get sender => RealmObjectBase.get<String>(this, 'sender') as String;
  @override
  set sender(String value) => RealmObjectBase.set(this, 'sender', value);

  @override
  String get text => RealmObjectBase.get<String>(this, 'text') as String;
  @override
  set text(String value) => RealmObjectBase.set(this, 'text', value);

  @override
  DateTime get timestamp =>
      RealmObjectBase.get<DateTime>(this, 'timestamp') as DateTime;
  @override
  set timestamp(DateTime value) =>
      RealmObjectBase.set(this, 'timestamp', value);

  @override
  Stream<RealmObjectChanges<ApplicationMessage>> get changes =>
      RealmObjectBase.getChanges<ApplicationMessage>(this);

  @override
  ApplicationMessage freeze() =>
      RealmObjectBase.freezeObject<ApplicationMessage>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'sender': sender.toEJson(),
      'text': text.toEJson(),
      'timestamp': timestamp.toEJson(),
    };
  }

  static EJsonValue _toEJson(ApplicationMessage value) => value.toEJson();
  static ApplicationMessage _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'sender': EJsonValue sender,
        'text': EJsonValue text,
        'timestamp': EJsonValue timestamp,
      } =>
        ApplicationMessage(
          fromEJson(id),
          fromEJson(sender),
          fromEJson(text),
          fromEJson(timestamp),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(ApplicationMessage._);
    register(_toEJson, _fromEJson);
    return SchemaObject(
        ObjectType.realmObject, ApplicationMessage, 'ApplicationMessage', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('sender', RealmPropertyType.string),
      SchemaProperty('text', RealmPropertyType.string),
      SchemaProperty('timestamp', RealmPropertyType.timestamp),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class ApplicationGroup extends _ApplicationGroup
    with RealmEntity, RealmObjectBase, RealmObject {
  ApplicationGroup(
    ObjectId id,
    String ownerId,
    String name,
    bool isPrivate,
    bool isFavorite,
    DateTime lastModified,
    DateTime createdOn, {
    Iterable<String> members = const [],
    Iterable<ApplicationMessage> messages = const [],
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'owner_id', ownerId);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set<RealmList<String>>(
        this, 'members', RealmList<String>(members));
    RealmObjectBase.set<RealmList<ApplicationMessage>>(
        this, 'messages', RealmList<ApplicationMessage>(messages));
    RealmObjectBase.set(this, 'isPrivate', isPrivate);
    RealmObjectBase.set(this, 'isFavorite', isFavorite);
    RealmObjectBase.set(this, 'lastModified', lastModified);
    RealmObjectBase.set(this, 'createdOn', createdOn);
  }

  ApplicationGroup._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get ownerId => RealmObjectBase.get<String>(this, 'owner_id') as String;
  @override
  set ownerId(String value) => RealmObjectBase.set(this, 'owner_id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  RealmList<String> get members =>
      RealmObjectBase.get<String>(this, 'members') as RealmList<String>;
  @override
  set members(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<ApplicationMessage> get messages =>
      RealmObjectBase.get<ApplicationMessage>(this, 'messages')
          as RealmList<ApplicationMessage>;
  @override
  set messages(covariant RealmList<ApplicationMessage> value) =>
      throw RealmUnsupportedSetError();

  @override
  bool get isPrivate => RealmObjectBase.get<bool>(this, 'isPrivate') as bool;
  @override
  set isPrivate(bool value) => RealmObjectBase.set(this, 'isPrivate', value);

  @override
  bool get isFavorite => RealmObjectBase.get<bool>(this, 'isFavorite') as bool;
  @override
  set isFavorite(bool value) => RealmObjectBase.set(this, 'isFavorite', value);

  @override
  DateTime get lastModified =>
      RealmObjectBase.get<DateTime>(this, 'lastModified') as DateTime;
  @override
  set lastModified(DateTime value) =>
      RealmObjectBase.set(this, 'lastModified', value);

  @override
  DateTime get createdOn =>
      RealmObjectBase.get<DateTime>(this, 'createdOn') as DateTime;
  @override
  set createdOn(DateTime value) =>
      RealmObjectBase.set(this, 'createdOn', value);

  @override
  Stream<RealmObjectChanges<ApplicationGroup>> get changes =>
      RealmObjectBase.getChanges<ApplicationGroup>(this);

  @override
  ApplicationGroup freeze() =>
      RealmObjectBase.freezeObject<ApplicationGroup>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'owner_id': ownerId.toEJson(),
      'name': name.toEJson(),
      'members': members.toEJson(),
      'messages': messages.toEJson(),
      'isPrivate': isPrivate.toEJson(),
      'isFavorite': isFavorite.toEJson(),
      'lastModified': lastModified.toEJson(),
      'createdOn': createdOn.toEJson(),
    };
  }

  static EJsonValue _toEJson(ApplicationGroup value) => value.toEJson();
  static ApplicationGroup _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'owner_id': EJsonValue ownerId,
        'name': EJsonValue name,
        'members': EJsonValue members,
        'messages': EJsonValue messages,
        'isPrivate': EJsonValue isPrivate,
        'isFavorite': EJsonValue isFavorite,
        'lastModified': EJsonValue lastModified,
        'createdOn': EJsonValue createdOn,
      } =>
        ApplicationGroup(
          fromEJson(id),
          fromEJson(ownerId),
          fromEJson(name),
          fromEJson(isPrivate),
          fromEJson(isFavorite),
          fromEJson(lastModified),
          fromEJson(createdOn),
          members: fromEJson(members),
          messages: fromEJson(messages),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(ApplicationGroup._);
    register(_toEJson, _fromEJson);
    return SchemaObject(
        ObjectType.realmObject, ApplicationGroup, 'ApplicationGroup', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('ownerId', RealmPropertyType.string, mapTo: 'owner_id'),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('members', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('messages', RealmPropertyType.object,
          linkTarget: 'ApplicationMessage',
          collectionType: RealmCollectionType.list),
      SchemaProperty('isPrivate', RealmPropertyType.bool),
      SchemaProperty('isFavorite', RealmPropertyType.bool),
      SchemaProperty('lastModified', RealmPropertyType.timestamp),
      SchemaProperty('createdOn', RealmPropertyType.timestamp),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
