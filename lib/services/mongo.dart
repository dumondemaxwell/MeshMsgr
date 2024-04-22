import 'package:mongo_dart/mongo_dart.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Message {
  final String id;
  final String message;
  final String time;
  final bool isRead;
  final bool isSender;
  final DateTime createdAt = DateTime.now();

  Message({
    required this.id,
    required this.message,
    required this.time,
    required this.isRead,
    required this.isSender,
  });
}


class Group {
  final String id;
  final String name;
  final String image;
  final List<String> members;
  final List<Message> messages;
  final DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  Group({
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

  Future<List<Group>> getMessagesAndGroupsForUser(String username) async {
    var db = await initDatabaseAsync();
    var groups = <Group>[
      Group(id: 'id', name: 'name', image: '', members: [
        'member1',
        'member2',
        'member3',
        'member4',
        'member5',
        'member6',
        'member7',
        'member8',
      ], messages: [
        Message(id: 'id', message: 'message', time: 'time', isRead: true, isSender: true),
        Message(id: 'id', message: 'message', time: 'time', isRead: true, isSender: true),
        Message(id: 'id', message: 'message', time: 'time', isRead: true, isSender: true),
        Message(id: 'id', message: 'message', time: 'time', isRead: true, isSender: true),
        Message(id: 'id', message: 'message', time: 'time', isRead: true, isSender: true),
        Message(id: 'id', message: 'message', time: 'time', isRead: true, isSender: true),
        Message(id: 'id', message: 'message', time: 'time', isRead: true, isSender: true),
        Message(id: 'id', message: 'message', time: 'time', isRead: true, isSender: true),
      ]),
    ];

    // var groupCollection = db.collection('groups');
    // var messageCollection = db.collection('messages');
    //
    // var result = await groupCollection.find(where.eq('members', username)).toList();
    // for (var group in result) {
    //   var groupMessages = <Message>[];
    //   groups.add(Group(
    //     id: group['_id'],
    //     name: group['name'],
    //     image: group['image'],
    //     members: group['members'],
    //     messages: groupMessages,
    //   ));
    // }
    // groupCollection.modernFind().toList().then((value) {
    //   for (var group in value) {
    //     groups.add(Group(id: 'id', name: 'name', image: 'image', members: [], messages: []));
    //   }
    // });

    // print('groups: $groups');
    return groups;
  }

  Future<void> addMessageToGroup(String groupId, Message message) async {
    var db = await initDatabaseAsync();
    await db.collection('messages').insert({
      'groupId': groupId,
      'message': message.message,
      'time': message.time,
      'isRead': message.isRead,
      'isSender': message.isSender,
    });
  }

  Future<void> addGroup(Group group) async {
    var db = await initDatabaseAsync();
    await db.collection('groups').insert({
      'name': group.name,
      'image': group.image,
      'members': group.members,
    });
  }
}