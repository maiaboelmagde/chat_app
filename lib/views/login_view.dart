import 'dart:developer';

import 'package:chat_app/constants.dart';
import 'package:chat_app/views/register_view.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/text_field_custom.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String id = 'LoginView';

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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sign In',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Pacifico',
                      color: Colors.white),
                ),
              ),
              SizedBox(height: 30),
              TextFieldCustom(hint: 'Email'),
              SizedBox(height: 30),
              TextFieldCustom(hint: 'Password'),
              SizedBox(height: 30),
              CustomButton(text: 'Sign In'),
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Don\'t have an account ? .. ',
                style: TextStyle(color: Colors.white),
              ),
              GestureDetector(
                child: const Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pushNamed(context, RegisterView.id);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}