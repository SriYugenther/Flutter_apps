import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:figma_ex_app/chatmessage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _messagecontroller = TextEditingController();

  @override
  void dispose() {
    _messagecontroller.dispose();
    super.dispose();
  }

  void _sendbutton() async {
    final enteredmessage = _messagecontroller.text;
    if (enteredmessage.trim().isEmpty) {
      return;
    }
    //this is used to close the keyboard
    FocusScope.of(context).unfocus();
    _messagecontroller.clear();

    //this code is used to get the details of current loggedin user
    final user = FirebaseAuth.instance.currentUser;

    //this is used to get the already stored data from the database
    final userdata = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();

    //this  code is used yto store the meassage along with user data
    FirebaseFirestore.instance.collection('chat_Message').add({
      'text': enteredmessage,
      'createdat': Timestamp.now(),
      'userid': user.uid,
      'username': userdata.data()!['username'],
      "userimage": userdata.data()!['image_url'],
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(199, 45, 134, 117),
          title: const Text("Chat App"),
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                icon: Icon(Icons.logout_rounded))
          ],
        ),
        body: Column(
          children: [
            Expanded(child: ChatMessage()),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 1,
                bottom: 14,
              ),
              child: Row(children: [
                Expanded(
                  child: TextField(
                    controller: _messagecontroller,
                    textCapitalization: TextCapitalization.sentences,
                    autocorrect: true,
                    enableSuggestions: true,
                    decoration: const InputDecoration(
                      label: Text("Send a Message"),
                    ),
                  ),
                ),
                IconButton(
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: _sendbutton,
                    icon: Icon(Icons.send))
              ]),
            ),
          ],
        ));
  }
}
