import '/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/chat/new_message.dart';
import '../widgets/chat/messages.dart';

class ChatScreen extends StatelessWidget {
  static const routeName = '/chat';

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final String vendorId = routeArgs['vendorId'] as String;
    final String vendorName = routeArgs['vendorName'] as String;
    final String vendorImageUrl = routeArgs['vendorImageUrl'] as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(vendorName),
        backgroundColor: white,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Messages(vendorId),
            ),
            NewMessage(vendorId),
          ],
        ),
      ),
    );
  }
}
