import 'package:flutter/material.dart';

import '../../services/socket/socket.dart';

mixin class ChatViewManager {
  void listenMessageEvent(VoidCallback acction) {
    WebSocketManager.instance.webSocketReceiver("receiveMessage", (data) {
      acction();
    });
  }

  Future<void> sendMessage(String sender, VoidCallback setState) async {
    // WebSocketManager.instance.webSocketSender("sendMessage", data.toJson());
  }

  Alignment setMessageAlignment(String? senderName, String? userName) {
    switch (senderName == userName) {
      case true:
        return Alignment.topRight;
      case false:
        return Alignment.topLeft;
    }
  }
}
