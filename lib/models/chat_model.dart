import 'package:trabalho/models/message_model.dart';
import 'package:trabalho/models/profile_model.dart';

class ChatModel {
  String? id;
  String? senderId;
  String? recipientId;
  String? date;
  ProfileModel? profile;
  List<MessageModel>? messages;

  ChatModel(
      {this.id,
      this.date,
      this.messages,
      this.profile,
      this.recipientId,
      this.senderId});

  ChatModel.fromJson(Map json) {
    id = json['id'];
    recipientId = json['recipientId'];
    senderId = json['senderId'];
    date = json['date'];
    profile = ProfileModel.fromJson(json['profile']);
    messages = lisMessages(json['messages']);
  }

  List<MessageModel> lisMessages(dynamic json) {
    List<MessageModel> messages = [];
    if (json is List) {
      for (var item in json) {
        if (item is Map) {
          MessageModel msg = MessageModel();
          msg = MessageModel.fromJson(item);
          messages.add(msg);
        }
      }
    }
    return messages;
  }
}
