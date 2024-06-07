class MessagesModel {
  int? chatChatId;
  String? otherUserName;
  String? otherUserAvatar;
  String? lastMessageText;
  String? lastMessageTime;
  int? otherUserId;

  MessagesModel(
      {this.chatChatId,
      this.otherUserName,
      this.otherUserAvatar,
      this.lastMessageText,
      this.lastMessageTime,
      this.otherUserId});

  MessagesModel.fromJson(Map<String, dynamic> json) {
    chatChatId = json['chat_chat_id'];
    otherUserName = json['other_user_name'];
    otherUserAvatar = json['other_user_avatar'];
    lastMessageText = json['last_message_text'];
    lastMessageTime = json['last_message_time'];
    otherUserId = json['other_user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chat_chat_id'] = chatChatId;
    data['other_user_name'] = otherUserName;
    data['other_user_avatar'] = otherUserAvatar;
    data['last_message_text'] = lastMessageText;
    data['last_message_time'] = lastMessageTime;
    data['other_user_id'] = otherUserId;
    return data;
  }
}
