import 'dart:developer';

import 'package:chat_app/constants.dart';
import 'package:chat_app/services/registeruser_using_firebase.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/show_snack_bar.dart';
import 'package:chat_app/widgets/text_field_custom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  String? email;
  String? password;

  GlobalKey<FormState> globalKey = GlobalKey();

  static const String id = 'RegisterView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Form(
        key: globalKey,
        child: ListView(
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
                    if (globalKey.currentState!.validate()) {
                      try {
                        await registerUser(email ?? '', password ?? '');
                      } on FirebaseAuthException catch (e) {
                        String? message;
                        if (e.code == 'weak-password') {
                          message =
                              "The password provided is so weak , it should contain 6 letters at least";
                        } else if (e.code == 'email-already-in-use') {
                          message = "That email already hase an account";
                        }
                        showSnackBar(context, message ?? e.toString());
                      } catch (e) {
                        showSnackBar(context, e.toString());
                      }
                    }
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
      ),
    );
  }
}
