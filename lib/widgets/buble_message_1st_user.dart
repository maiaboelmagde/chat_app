import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class BubleMessage1stUser extends StatelessWidget {
  const BubleMessage1stUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        bottom: 5,
        left: 3,
      ),
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15, top: 15),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        color: kPrimaryColor,
      ),
      child: Text('User 1 Message '),
    );
  }
}
