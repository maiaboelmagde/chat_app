import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/views/chat_view.dart';
import 'package:chat_app/views/register_view.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/text_field_custom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  static const String id = 'LoginView';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String? email, password;

  GlobalKey<FormState> loginkey = GlobalKey();

  bool isLoding = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoding,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Form(
          key: loginkey,
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
                      'Sign In',
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
                    onchanged: (data) {
                      password = data;
                    },
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                    text: 'Sign In',
                    ontap: () async {
                      if (loginkey.currentState!.validate()) {
                        try {
                          isLoding = true;
                          setState(() {});
                          await loginUser();
                          showSnackBar(context, 'succeed');
                          Navigator.pushNamed(context, chatView.id);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            showSnackBar(
                                context, 'No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            showSnackBar(context,
                                'Wrong password provided for that user.');
                          } else {
                            showSnackBar(context, e.code.toString());
                          }
                        } catch (e) {
                          showSnackBar(context, e.toString());
                        }
                        isLoding = false;
                        setState(() {});
                      }
                    },
                  ),
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
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
