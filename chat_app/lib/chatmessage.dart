import './message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({super.key});
  @override
  Widget build(BuildContext context) {
    final authuser = FirebaseAuth.instance.currentUser!;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat_Message')
          .orderBy('createdat', descending: true)
          .snapshots(),
      builder: (context, chatsnapshot) {
        if (chatsnapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!chatsnapshot.hasData || chatsnapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text("Start Chating"),
          );
        }
        if (chatsnapshot.hasError) {
          return const Center(
            child: Text("Something Went Wrong"),
          );
        }
        final loadedmessage = chatsnapshot.data!.docs;
        return ListView.builder(
            padding: const EdgeInsets.only(bottom: 40, left: 13, right: 13),
            reverse: true,
            itemCount: loadedmessage.length,
            itemBuilder: (context, index) {
              final chatmessage = loadedmessage[index].data();
              final nextmessage = index + 1 < loadedmessage.length
                  ? loadedmessage[index + 1].data()
                  : null;
              final currentmessageid = chatmessage['userid'];
              final nextmessageid =
                  nextmessage != null ? nextmessage['userid'] : null;

              final nextuserissame = currentmessageid == nextmessageid;

              if (nextuserissame) {
                return MessageBubble.next(
                  message: chatmessage['text'],
                  isMe: authuser.uid == currentmessageid,
                );
              } else {
                return MessageBubble.first(
                    userImage: chatmessage['userimage'],
                    username: chatmessage['username'],
                    message: chatmessage['text'],
                    isMe: authuser.uid == currentmessageid);
              }
            });
      },
    );
  }
}
