import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventique/widgets/chat/message_bubble.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  final String vendorId;

  const Messages(this.vendorId, {super.key});

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final chatId = userId + '_' + vendorId;

    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chats')
          .doc(chatId)
          .collection('messages')
          .orderBy('createdAt', descending: true)
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
        if (!chatSnapshot.hasData || chatSnapshot.data == null) {
          return const Center(
            child: Text('No messages yet.'),
          );
        }
        final chatDocs = chatSnapshot.data!.docs;
        if (chatDocs.isEmpty) {
          return const Center(
            child: Text('Start a new chat.'),
          );
        }
        return ListView.builder(
          reverse: true,
          itemCount: chatDocs.length,
          itemBuilder: (ctx, i) {
            return MessageBubble(
              chatDocs[i]['text'],
              chatDocs[i]['userName'],
              chatDocs[i]['userImage'],
              chatDocs[i]['userId'] == FirebaseAuth.instance.currentUser!.uid,
              key: ValueKey(chatDocs[i].id),
            );
          },
        );
      },
    );
  }
}
