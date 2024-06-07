class ChatModel {
  int? chatId;
  List<History>? history;

  ChatModel({this.chatId, this.history});

  ChatModel.fromJson(Map<String, dynamic> json) {
    chatId = json['chat_id'];
    if (json['history'] != null) {
      history = <History>[];
      json['history'].forEach((v) {
        history!.add(History.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chat_id'] = chatId;
    if (history != null) {
      data['history'] = history!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class History {
  int? messageId;
  String? messageText;
  String? timestamp;
  Sender? sender;

  History({this.messageId, this.messageText, this.timestamp, this.sender});

  History.fromJson(Map<String, dynamic> json) {
    messageId = json['message_id'];
    messageText = json['message_text'];
    timestamp = json['timestamp'];
    sender = json['sender'] != null ? Sender.fromJson(json['sender']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message_id'] = messageId;
    data['message_text'] = messageText;
    data['timestamp'] = timestamp;
    if (sender != null) {
      data['sender'] = sender!.toJson();
    }
    return data;
  }
}

class Sender {
  int? userId;
  String? displayName;
  String? avatar;

  Sender({this.userId, this.displayName, this.avatar});

  Sender.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    displayName = json['display_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['display_name'] = displayName;
    data['avatar'] = avatar;
    return data;
  }
}
