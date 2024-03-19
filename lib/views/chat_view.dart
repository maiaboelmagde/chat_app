import 'package:chat_app/constants.dart';
import 'package:chat_app/widgets/my_buble_message.dart';
import 'package:chat_app/widgets/friend_bubble_message.dart';
import 'package:chat_app/widgets/send_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});
  static const String id = 'chatView';

  CollectionReference messages =
      FirebaseFirestore.instance.collection(messageCollection);

  TextEditingController controller = TextEditingController();
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    String user_id = ModalRoute.of(context)!.settings.arguments as String;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy('time', descending: true).snapshots(),
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
                        reverse: true,
                        controller: _controller,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, indx) {
                          return user_id == snapshot.data!.docs[indx]['id']
                              ? MyBubleMessage(
                                  text: snapshot.data!.docs[indx]['message'],
                                )
                              : FriendBubleMessage(
                                  text: snapshot.data!.docs[indx]['message']);
                        }),
                  ),
                  SendTextField(
                    controller: controller,
                    onSubmitted: (data) {
                      messages.add({
                        'message': data,
                        'time': DateTime.now(),
                        'id': user_id
                      });
                      controller.clear();
                      _controller.animateTo(
                          _controller.position.minScrollExtent,
                          duration: Duration(seconds: 1),
                          curve: Curves.easeIn);
                    },
                  )
                ],
              ),
            );
          } else {
            return const Text("Loading");
          }
        });
  }
}
