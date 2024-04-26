class ChatRoomModel {
  int? id;
  int? chatId;
  String? sender;
  String? message;
  int? modifiedAt;

  ChatRoomModel(
      {this.id, this.chatId, this.sender, this.message, this.modifiedAt});

  ChatRoomModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chatId = json['chat_id'];
    sender = json['sender'];
    message = json['message'];
    modifiedAt = json['modified_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['chat_id'] = chatId;
    data['sender'] = sender;
    data['message'] = message;
    data['modified_at'] = modifiedAt;
    return data;
  }
}
