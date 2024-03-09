import 'dart:developer';

import 'package:chat_app/views/login_view.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/text_field_custom.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
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
          const SizedBox(height: 50),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sign Up',
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
              TextFieldCustom(hint: 'Confirm Password'),
              SizedBox(height: 30),
              CustomButton(text: 'Sign Up'),
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
