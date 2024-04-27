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
    String linkerId,
    String username,
    DateTime lastActive,
    DateTime createdOn,
    String avatar,
    bool enableSplash, {
    Iterable<String> groups = const [],
    Iterable<String> sent = const [],
    Iterable<String> received = const [],
    ApplicationUserSettings? settings,
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'linkerId', linkerId);
    RealmObjectBase.set(this, 'username', username);
    RealmObjectBase.set<RealmList<String>>(
        this, 'groups', RealmList<String>(groups));
    RealmObjectBase.set<RealmList<String>>(
        this, 'sent', RealmList<String>(sent));
    RealmObjectBase.set<RealmList<String>>(
        this, 'received', RealmList<String>(received));
    RealmObjectBase.set(this, 'lastActive', lastActive);
    RealmObjectBase.set(this, 'createdOn', createdOn);
    RealmObjectBase.set(this, 'avatar', avatar);
    RealmObjectBase.set(this, 'enableSplash', enableSplash);
    RealmObjectBase.set(this, 'settings', settings);
  }

  ApplicationUser._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get linkerId =>
      RealmObjectBase.get<String>(this, 'linkerId') as String;
  @override
  set linkerId(String value) => RealmObjectBase.set(this, 'linkerId', value);

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
  RealmList<String> get sent =>
      RealmObjectBase.get<String>(this, 'sent') as RealmList<String>;
  @override
  set sent(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<String> get received =>
      RealmObjectBase.get<String>(this, 'received') as RealmList<String>;
  @override
  set received(covariant RealmList<String> value) =>
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
  String get avatar => RealmObjectBase.get<String>(this, 'avatar') as String;
  @override
  set avatar(String value) => RealmObjectBase.set(this, 'avatar', value);

  @override
  bool get enableSplash =>
      RealmObjectBase.get<bool>(this, 'enableSplash') as bool;
  @override
  set enableSplash(bool value) =>
      RealmObjectBase.set(this, 'enableSplash', value);

  @override
  ApplicationUserSettings? get settings =>
      RealmObjectBase.get<ApplicationUserSettings>(this, 'settings')
          as ApplicationUserSettings?;
  @override
  set settings(covariant ApplicationUserSettings? value) =>
      RealmObjectBase.set(this, 'settings', value);

  @override
  Stream<RealmObjectChanges<ApplicationUser>> get changes =>
      RealmObjectBase.getChanges<ApplicationUser>(this);

  @override
  ApplicationUser freeze() =>
      RealmObjectBase.freezeObject<ApplicationUser>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'linkerId': linkerId.toEJson(),
      'username': username.toEJson(),
      'groups': groups.toEJson(),
      'sent': sent.toEJson(),
      'received': received.toEJson(),
      'lastActive': lastActive.toEJson(),
      'createdOn': createdOn.toEJson(),
      'avatar': avatar.toEJson(),
      'enableSplash': enableSplash.toEJson(),
      'settings': settings.toEJson(),
    };
  }

  static EJsonValue _toEJson(ApplicationUser value) => value.toEJson();
  static ApplicationUser _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'linkerId': EJsonValue linkerId,
        'username': EJsonValue username,
        'groups': EJsonValue groups,
        'sent': EJsonValue sent,
        'received': EJsonValue received,
        'lastActive': EJsonValue lastActive,
        'createdOn': EJsonValue createdOn,
        'avatar': EJsonValue avatar,
        'enableSplash': EJsonValue enableSplash,
        'settings': EJsonValue settings,
      } =>
        ApplicationUser(
          fromEJson(id),
          fromEJson(linkerId),
          fromEJson(username),
          fromEJson(lastActive),
          fromEJson(createdOn),
          fromEJson(avatar),
          fromEJson(enableSplash),
          groups: fromEJson(groups),
          sent: fromEJson(sent),
          received: fromEJson(received),
          settings: fromEJson(settings),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(ApplicationUser._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, ApplicationUser, 'users', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('linkerId', RealmPropertyType.string),
      SchemaProperty('username', RealmPropertyType.string),
      SchemaProperty('groups', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('sent', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('received', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('lastActive', RealmPropertyType.timestamp),
      SchemaProperty('createdOn', RealmPropertyType.timestamp),
      SchemaProperty('avatar', RealmPropertyType.string),
      SchemaProperty('enableSplash', RealmPropertyType.bool),
      SchemaProperty('settings', RealmPropertyType.object,
          optional: true, linkTarget: 'user_settings'),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class ApplicationUserSettings extends _ApplicationUserSettings
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  ApplicationUserSettings(
    ObjectId id,
    bool isOnline,
    bool isSplashOn,
    bool isLocationOn,
    DateTime lastModified,
    DateTime createdOn, {
    bool isDarkMode = false,
    bool isNotificationOn = true,
    bool isSoundOn = true,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<ApplicationUserSettings>({
        'isDarkMode': false,
        'isNotificationOn': true,
        'isSoundOn': true,
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'isDarkMode', isDarkMode);
    RealmObjectBase.set(this, 'isNotificationOn', isNotificationOn);
    RealmObjectBase.set(this, 'isSoundOn', isSoundOn);
    RealmObjectBase.set(this, 'isOnline', isOnline);
    RealmObjectBase.set(this, 'isSplashOn', isSplashOn);
    RealmObjectBase.set(this, 'isLocationOn', isLocationOn);
    RealmObjectBase.set(this, 'lastModified', lastModified);
    RealmObjectBase.set(this, 'createdOn', createdOn);
  }

  ApplicationUserSettings._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  bool get isDarkMode => RealmObjectBase.get<bool>(this, 'isDarkMode') as bool;
  @override
  set isDarkMode(bool value) => RealmObjectBase.set(this, 'isDarkMode', value);

  @override
  bool get isNotificationOn =>
      RealmObjectBase.get<bool>(this, 'isNotificationOn') as bool;
  @override
  set isNotificationOn(bool value) =>
      RealmObjectBase.set(this, 'isNotificationOn', value);

  @override
  bool get isSoundOn => RealmObjectBase.get<bool>(this, 'isSoundOn') as bool;
  @override
  set isSoundOn(bool value) => RealmObjectBase.set(this, 'isSoundOn', value);

  @override
  bool get isOnline => RealmObjectBase.get<bool>(this, 'isOnline') as bool;
  @override
  set isOnline(bool value) => RealmObjectBase.set(this, 'isOnline', value);

  @override
  bool get isSplashOn => RealmObjectBase.get<bool>(this, 'isSplashOn') as bool;
  @override
  set isSplashOn(bool value) => RealmObjectBase.set(this, 'isSplashOn', value);

  @override
  bool get isLocationOn =>
      RealmObjectBase.get<bool>(this, 'isLocationOn') as bool;
  @override
  set isLocationOn(bool value) =>
      RealmObjectBase.set(this, 'isLocationOn', value);

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
  RealmResults<ApplicationUser> get user {
    if (!isManaged) {
      throw RealmError('Using backlinks is only possible for managed objects.');
    }
    return RealmObjectBase.get<ApplicationUser>(this, 'user')
        as RealmResults<ApplicationUser>;
  }

  @override
  set user(covariant RealmResults<ApplicationUser> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<ApplicationUserSettings>> get changes =>
      RealmObjectBase.getChanges<ApplicationUserSettings>(this);

  @override
  ApplicationUserSettings freeze() =>
      RealmObjectBase.freezeObject<ApplicationUserSettings>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'isDarkMode': isDarkMode.toEJson(),
      'isNotificationOn': isNotificationOn.toEJson(),
      'isSoundOn': isSoundOn.toEJson(),
      'isOnline': isOnline.toEJson(),
      'isSplashOn': isSplashOn.toEJson(),
      'isLocationOn': isLocationOn.toEJson(),
      'lastModified': lastModified.toEJson(),
      'createdOn': createdOn.toEJson(),
    };
  }

  static EJsonValue _toEJson(ApplicationUserSettings value) => value.toEJson();
  static ApplicationUserSettings _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'isDarkMode': EJsonValue isDarkMode,
        'isNotificationOn': EJsonValue isNotificationOn,
        'isSoundOn': EJsonValue isSoundOn,
        'isOnline': EJsonValue isOnline,
        'isSplashOn': EJsonValue isSplashOn,
        'isLocationOn': EJsonValue isLocationOn,
        'lastModified': EJsonValue lastModified,
        'createdOn': EJsonValue createdOn,
      } =>
        ApplicationUserSettings(
          fromEJson(id),
          fromEJson(isOnline),
          fromEJson(isSplashOn),
          fromEJson(isLocationOn),
          fromEJson(lastModified),
          fromEJson(createdOn),
          isDarkMode: fromEJson(isDarkMode),
          isNotificationOn: fromEJson(isNotificationOn),
          isSoundOn: fromEJson(isSoundOn),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(ApplicationUserSettings._);
    register(_toEJson, _fromEJson);
    return SchemaObject(
        ObjectType.realmObject, ApplicationUserSettings, 'user_settings', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('isDarkMode', RealmPropertyType.bool),
      SchemaProperty('isNotificationOn', RealmPropertyType.bool),
      SchemaProperty('isSoundOn', RealmPropertyType.bool),
      SchemaProperty('isOnline', RealmPropertyType.bool),
      SchemaProperty('isSplashOn', RealmPropertyType.bool),
      SchemaProperty('isLocationOn', RealmPropertyType.bool),
      SchemaProperty('lastModified', RealmPropertyType.timestamp),
      SchemaProperty('createdOn', RealmPropertyType.timestamp),
      SchemaProperty('user', RealmPropertyType.linkingObjects,
          linkOriginProperty: 'settings',
          collectionType: RealmCollectionType.list,
          linkTarget: 'users'),
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
        ObjectType.realmObject, ApplicationMessage, 'messages', [
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
    return SchemaObject(ObjectType.realmObject, ApplicationGroup, 'groups', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('ownerId', RealmPropertyType.string, mapTo: 'owner_id'),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('members', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('messages', RealmPropertyType.object,
          linkTarget: 'messages', collectionType: RealmCollectionType.list),
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
    return SchemaObject(ObjectType.realmObject, ApplicationCall, 'calls', [
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
