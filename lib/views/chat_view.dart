import 'package:chat_app/constants.dart';
import 'package:chat_app/widgets/buble_message_1st_user.dart';
import 'package:chat_app/widgets/send_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});
  static const String id = 'chatView';

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  CollectionReference messages =
      FirebaseFirestore.instance.collection(messageCollection);

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy('time').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: kPrimaryColor,
                automaticallyImplyLeading: false,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/scholar.png',
                      height: 60,
                    ),
                    const Text('Chat'),
                  ],
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, indx) {
                          return BubleMessage1stUser(
                            text: snapshot.data!.docs[indx]['message'],
                          );
                        }),
                  ),
                  SendTextField(
                    controller: controller,
                    onSubmitted: (data) {
                      messages.add({'message': data, 'time': DateTime.now()});
                      controller.clear();
                      setState(() {});
                    },
                  )
                ],
              ),
            );
          } else {
            return const Text("There's an error");
          }
        });
  }
}
