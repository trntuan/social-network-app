import 'package:flutter/foundation.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../const/const_app.dart';
import '../../helpers/helper_log.dart';

final class WebSocketManager {
  //I want init one time connection so I using singleton pattern
  static final WebSocketManager instance = WebSocketManager();

  String _fetchBaseUrl() {
    switch (kDebugMode) {
      case true:
        return "http://localhost:3000";
      default:
        //Product host url
        return "";
    }
  }

  //Our socket object
  // IO.Socket get socket => IO.io(
  //     _fetchBaseUrl(), IO.OptionBuilder().setTransports(['websocket']).build());
  IO.Socket get socket => IO.io('http://${ConstApp.apiAuthority}/socket',
      IO.OptionBuilder().setTransports(['websocket']).build());

  initializeSocketConnection() {
    try {
      socket.connect();
      socket.onConnect((_) {
        HelperLog.logInfo("Websocket connection success");
      });

      socket.on('sendMessage', (data) {
        HelperLog.logInfo("sendMessage:: $data");
      });
    } catch (e) {
      HelperLog.logCatchErrors(
          tag: "initializeSocketConnection",
          message: "Error in socket connection",
          errors: e.toString());
    }
  }

  disconnectFromSocket() {
    HelperLog.logSocket("disconnectFromSocket");

    socket.disconnect();
    socket
        .onDisconnect((data) => HelperLog.logSocket("Websocket disconnected"));
  }

  //Getting data from subscribed messages and calling onEvent callback
  void webSocketReceiver(String eventName, Function(dynamic) onEvent) {
    HelperLog.logSocket(
        'Websocket receiver called with event $eventName and body $onEvent');

    socket.on(eventName, (data) {
      onEvent(data);
    });
  }

  //Sending data to any channel
  void webSocketSender(String eventName, dynamic body) {
    HelperLog.logSocket(
        'Websocket sender called with event $eventName and body $body');

    socket.emit(eventName, body);
  }
}
