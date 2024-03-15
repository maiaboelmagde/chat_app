import 'package:chat_app/constants.dart';
import 'package:chat_app/services/registeruser_using_firebase.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/widgets/text_field_custom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterView extends StatefulWidget {
  RegisterView({super.key});
  static const String id = 'RegisterView';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String? email;

  String? password;
  String? confirmedPassword;

  GlobalKey<FormState> globalKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
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
                  TextFieldCustom(
                    hint: 'Confirm Password',
                    onchanged: (data_3) {
                      confirmedPassword = data_3;
                    },
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                    text: 'Sign Up',
                    ontap: () async {
                      if (globalKey.currentState!.validate()) {
                        if (confirmedPassword != password) {
                          showSnackBar(context,
                              'the password & confirmed password should be the same , please rewrite them');
                        } else {
                          isLoading = true;
                          setState(() {});
                          try {
                            await registerUser(email ?? '', password ?? '');
                            showSnackBar(context, 'Successed');
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
                          isLoading = false;
                          setState(() {});
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
      ),
    );
  }
}
