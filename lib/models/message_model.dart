class MessageModel {
  String? id;
  String? senderId;
  String? recipientId;
  String? date;
  String? text;
  String? type;

  MessageModel(
      {this.date,
      this.recipientId,
      this.id,
      this.senderId,
      this.text,
      this.type});

  MessageModel.fromJson(Map json) {
    id = json['id'];
    recipientId = json['recipientId'];
    senderId = json['senderId'];
    date = json['date'];
    text = json['text'];
    type = json['type'];
  }
}
