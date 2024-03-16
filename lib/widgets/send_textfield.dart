import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class SendTextField extends StatelessWidget {
  const SendTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: TextField(
        decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.send,
              color: Colors.blue,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: kPrimaryColor),
            )),
      ),
    );
  }
}
