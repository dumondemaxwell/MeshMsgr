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
    DateTime lastActive,
    DateTime createdOn,
    bool isOnline, {
    Iterable<String> groups = const [],
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'username', username);
    RealmObjectBase.set<RealmList<String>>(
        this, 'groups', RealmList<String>(groups));
    RealmObjectBase.set(this, 'lastActive', lastActive);
    RealmObjectBase.set(this, 'createdOn', createdOn);
    RealmObjectBase.set(this, 'isOnline', isOnline);
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
  RealmList<String> get groups =>
      RealmObjectBase.get<String>(this, 'groups') as RealmList<String>;
  @override
  set groups(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  DateTime get lastActive =>
      RealmObjectBase.get<DateTime>(this, 'lastActive') as DateTime;
  @override
  set lastActive(DateTime value) =>
      RealmObjectBase.set(this, 'lastActive', value);

  @override
  DateTime get createdOn =>
      RealmObjectBase.get<DateTime>(this, 'createdOn') as DateTime;
  @override
  set createdOn(DateTime value) =>
      RealmObjectBase.set(this, 'createdOn', value);

  @override
  bool get isOnline => RealmObjectBase.get<bool>(this, 'isOnline') as bool;
  @override
  set isOnline(bool value) => RealmObjectBase.set(this, 'isOnline', value);

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
      'groups': groups.toEJson(),
      'lastActive': lastActive.toEJson(),
      'createdOn': createdOn.toEJson(),
      'isOnline': isOnline.toEJson(),
    };
  }

  static EJsonValue _toEJson(ApplicationUser value) => value.toEJson();
  static ApplicationUser _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'username': EJsonValue username,
        'groups': EJsonValue groups,
        'lastActive': EJsonValue lastActive,
        'createdOn': EJsonValue createdOn,
        'isOnline': EJsonValue isOnline,
      } =>
        ApplicationUser(
          fromEJson(id),
          fromEJson(username),
          fromEJson(lastActive),
          fromEJson(createdOn),
          fromEJson(isOnline),
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
      SchemaProperty('groups', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('lastActive', RealmPropertyType.timestamp),
      SchemaProperty('createdOn', RealmPropertyType.timestamp),
      SchemaProperty('isOnline', RealmPropertyType.bool),
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

class ApplicationCall extends _ApplicationCall
    with RealmEntity, RealmObjectBase, RealmObject {
  ApplicationCall(
    ObjectId id,
    String caller,
    String receiver,
    DateTime timestamp,
    bool isVideoCall,
    bool isMissed,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'caller', caller);
    RealmObjectBase.set(this, 'receiver', receiver);
    RealmObjectBase.set(this, 'timestamp', timestamp);
    RealmObjectBase.set(this, 'isVideoCall', isVideoCall);
    RealmObjectBase.set(this, 'isMissed', isMissed);
  }

  ApplicationCall._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get caller => RealmObjectBase.get<String>(this, 'caller') as String;
  @override
  set caller(String value) => RealmObjectBase.set(this, 'caller', value);

  @override
  String get receiver =>
      RealmObjectBase.get<String>(this, 'receiver') as String;
  @override
  set receiver(String value) => RealmObjectBase.set(this, 'receiver', value);

  @override
  DateTime get timestamp =>
      RealmObjectBase.get<DateTime>(this, 'timestamp') as DateTime;
  @override
  set timestamp(DateTime value) =>
      RealmObjectBase.set(this, 'timestamp', value);

  @override
  bool get isVideoCall =>
      RealmObjectBase.get<bool>(this, 'isVideoCall') as bool;
  @override
  set isVideoCall(bool value) =>
      RealmObjectBase.set(this, 'isVideoCall', value);

  @override
  bool get isMissed => RealmObjectBase.get<bool>(this, 'isMissed') as bool;
  @override
  set isMissed(bool value) => RealmObjectBase.set(this, 'isMissed', value);

  @override
  Stream<RealmObjectChanges<ApplicationCall>> get changes =>
      RealmObjectBase.getChanges<ApplicationCall>(this);

  @override
  ApplicationCall freeze() =>
      RealmObjectBase.freezeObject<ApplicationCall>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'caller': caller.toEJson(),
      'receiver': receiver.toEJson(),
      'timestamp': timestamp.toEJson(),
      'isVideoCall': isVideoCall.toEJson(),
      'isMissed': isMissed.toEJson(),
    };
  }

  static EJsonValue _toEJson(ApplicationCall value) => value.toEJson();
  static ApplicationCall _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'caller': EJsonValue caller,
        'receiver': EJsonValue receiver,
        'timestamp': EJsonValue timestamp,
        'isVideoCall': EJsonValue isVideoCall,
        'isMissed': EJsonValue isMissed,
      } =>
        ApplicationCall(
          fromEJson(id),
          fromEJson(caller),
          fromEJson(receiver),
          fromEJson(timestamp),
          fromEJson(isVideoCall),
          fromEJson(isMissed),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(ApplicationCall._);
    register(_toEJson, _fromEJson);
    return SchemaObject(
        ObjectType.realmObject, ApplicationCall, 'ApplicationCall', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('caller', RealmPropertyType.string),
      SchemaProperty('receiver', RealmPropertyType.string),
      SchemaProperty('timestamp', RealmPropertyType.timestamp),
      SchemaProperty('isVideoCall', RealmPropertyType.bool),
      SchemaProperty('isMissed', RealmPropertyType.bool),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
