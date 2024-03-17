import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class SendTextField extends StatelessWidget {
  const SendTextField(
      {super.key, required this.onSubmitted, required this.controller});
  final Function(String) onSubmitted;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: TextField(
        controller: controller,
        onSubmitted: onSubmitted,
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
