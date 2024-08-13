import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventique/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatListScreen extends StatelessWidget {
  static const routeName = 'chat-list';
  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chats')
            .where('users', arrayContains: userId)
            .snapshots(),
        builder: (ctx, chatSnapshot) {
          if (chatSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (chatSnapshot.hasError) {
            return const Center(
              child: Text('An error occurred, please try again later.'),
            );
          }
          if (!chatSnapshot.hasData || chatSnapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('No chats found.'),
            );
          }
          final chatDocs = chatSnapshot.data!.docs;
          return ListView.builder(
            itemCount: chatDocs.length,
            itemBuilder: (ctx, i) {
              final chatData = chatDocs[i].data() as Map<String, dynamic>;
              return ListTile(
                title: Text(chatData['vendorName']),
                subtitle: Text('Chat with ${chatData['vendorName']}'),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(chatData['vendorImageUrl']),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(
                    ChatScreen.routeName,
                    arguments: {
                      'vendorId': chatData['vendorId'],
                      'vendorName': chatData['vendorName'],
                      'vendorImageUrl': chatData['vendorImageUrl'],
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
