import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';

class Connection {
  static late Socket _socket;
  static bool hasConnected = false;

  static void connect(Function() onConnection) async {
    Socket.connect("195.122.229.149", 1234, timeout: const Duration(seconds: 5))
        .then((socket) =>
            {_socket = socket, onConnection.call(), hasConnected = true});
  }

  static void startListen(Function(String dataRetrieved) onMessageReceive) {
    _socket.listen((Uint8List value) {
      String dataRetrieved = const Utf8Decoder().convert(value);
      onMessageReceive.call(dataRetrieved);
      if (kDebugMode) {
        print(dataRetrieved);
      }
    });
  }

  static void write(String data) {
    _socket.write(data);
  }
}
