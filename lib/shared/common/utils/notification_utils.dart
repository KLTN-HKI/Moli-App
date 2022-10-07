import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';

import '../other/typedefs.dart';

extension RemoteMessageExt on RemoteMessage {
  String? getChannelId() {
    return data['channelId'] as String;
  }

  Map<String, dynamic> getContent() {
    return jsonDecode(data['content'] as String) as JSON;
  }

  Map<String, dynamic> getNotification() {
    return jsonDecode(data['notification'] as String) as JSON;
  }
}
