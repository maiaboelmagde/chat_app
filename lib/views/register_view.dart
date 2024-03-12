import 'dart:developer';

import 'package:chat_app/constants.dart';
import 'package:chat_app/views/login_view.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/text_field_custom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  String? email;
  String? password;

  static const String id = 'RegisterView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Center(
              child: Column(
                children: [
                  Image.asset('assets/images/scholar.png'),
                  const Text(
                    'Scolar Chat',
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Pacifico',
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Pacifico',
                      color: Colors.white),
                ),
              ),
              const SizedBox(height: 30),
              TextFieldCustom(
                hint: 'Email',
                onchanged: (data) {
                  email = data;
                },
              ),
              const SizedBox(height: 30),
              TextFieldCustom(
                hint: 'Password',
                onchanged: (data_2) {
                  password = data_2;
                },
              ),
              const SizedBox(height: 30),
              const TextFieldCustom(hint: 'Confirm Password'),
              const SizedBox(height: 30),
              CustomButton(
                text: 'Sign Up',
                ontap: () async {
                  try {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: email!, password: password!);
                  } on FirebaseAuthException catch (e) {}
                },
              ),
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Already have an account ? .. ',
                style: TextStyle(color: Colors.white),
              ),
              GestureDetector(
                child: const Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
