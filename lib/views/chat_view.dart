import 'package:chat_app/constants.dart';
import 'package:chat_app/widgets/buble_message_1st_user.dart';
import 'package:chat_app/widgets/send_textfield.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});
  static const String id = 'chatView';

  @override
  Widget build(BuildContext context) {
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
            child: ListView.builder(itemBuilder: (context, indx) {
              return const BubleMessage1stUser();
            }),
          ),
          const SendTextField()
        ],
      ),
    );
  }
}
