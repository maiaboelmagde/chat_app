import 'package:chat_app/widgets/text_field_custom.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
                  style: TextStyle(fontSize: 30, fontFamily: 'Pacifico'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Sign In',
                    style: TextStyle(fontSize: 20, fontFamily: 'Pacifico'),
                  ),
                ),
                SizedBox(height: 30),
                TextFieldCustom(hint: 'Email'),
                SizedBox(height: 30),
                TextFieldCustom(hint: 'Password'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account ? .. '),
                    Text('Sign Up'),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
