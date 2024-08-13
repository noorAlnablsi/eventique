import 'package:eventique/screens/vendor_profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/chat/new_message.dart';
import '../widgets/chat/messages.dart';

class ChatScreen extends StatelessWidget {
  static const routeName = '/chat';

  @override
  Widget build(BuildContext context) {
    final Map<String, String?> routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
    final String vendorId = routeArgs['vendorId']!;
    final String vendorName = routeArgs['vendorName']!;
    final String vendorImageUrl = routeArgs['vendorImageUrl']!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shape: Border(
          bottom: BorderSide(
            color: Colors.purple,
            width: 1.6,
          ),
        ),
        title: InkWell(
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey,
                backgroundImage: vendorImageUrl.isNotEmpty
                    ? NetworkImage(vendorImageUrl)
                    : null,
                child: vendorImageUrl.isNotEmpty
                    ? null
                    : Icon(
                        Icons.person,
                        size: 25,
                        color: Colors.white,
                      ),
              ),
              SizedBox(width: 16),
              Text(
                vendorName,
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 24,
                  fontFamily: 'IrishGrover',
                ),
              ),
            ],
          ),
          onTap: () {
            Navigator.of(context).pushNamed(
              VendorProfileScreen.routeName,
              arguments: vendorId,
            );
          },
        ),
        backgroundColor: Colors.white,
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
