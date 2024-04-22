import 'package:mongo_dart/mongo_dart.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MongoMessage {
  final String id;
  final String message;
  final String time;
  final bool isRead;
  final bool isSender;
  final DateTime createdAt = DateTime.now();

  MongoMessage({
    required this.id,
    required this.message,
    required this.time,
    required this.isRead,
    required this.isSender,
  });
}


class MongoGroupModel {
  final String id;
  final String name;
  final String image;
  final List<String> members;
  final List<MongoMessage> messages;
  final DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  MongoGroupModel({
    required this.id,
    required this.name,
    required this.image,
    required this.members,
    required this.messages,
  });
}

class MongoService {
  final requiredCollections = [
    'domains',
    'users',
    'messages',
    'groups',
    'contacts',
    'calls',
    'notifications'
  ];


  Future<Db> initDatabaseAsync() async {
    final db = await Db.create(dotenv.env['MONGODB_URI']!);
    try{
      await db.open();
    } catch (e) {
      throw Exception('Failed to connect to database');
    }

    if(!db.isConnected){
      throw Exception('Database connection failed');
    }

    for (var collection in requiredCollections) {
        await db.createCollection(collection);
    }

    return db;
  }

  Future<List<MongoGroupModel>> getMessagesAndGroupsForUser(String username) async {
    var db = await initDatabaseAsync();
    var groups = <MongoGroupModel>[];
    var groupCollection = db.collection('groups');
    var messageCollection = db.collection('messages');

    var result = await groupCollection.find(where.eq('members', username)).toList();
    for (var group in result) {
      var messages = await messageCollection.find(where.eq('groupId', group['_id'].toString())).toList();
      groups.add(MongoGroupModel(
        id: group['_id'].toString(),
        name: group['name'],
        image: group['image'],
        members: List<String>.from(group['members']),
        messages: messages.map((message) => MongoMessage(
          id: message['_id'].toString(),
          message: message['message'],
          time: message['time'],
          isRead: message['isRead'],
          isSender: message['isSender'],
        )).toList(),
      ));
    }
    print('groups: $groups');
    return groups;
  }

  Future<void> addMessageToGroup(String groupId, MongoMessage message) async {
    var db = await initDatabaseAsync();
    await db.collection('messages').insert({
      'groupId': groupId,
      'message': message.message,
      'time': message.time,
      'isRead': message.isRead,
      'isSender': message.isSender,
    });
  }

  Future<void> addGroup(MongoGroupModel group) async {
    var db = await initDatabaseAsync();
    await db.collection('groups').insert({
      'name': group.name,
      'image': group.image,
      'members': [
        ...group.members,
      ],
      'messages': [
        ...group.messages,
      ],
      'createdAt': group.createdAt,
      'updatedAt': group.updatedAt,
      'public': false,
    });
  }
}