import 'package:chat_app/views/login_view.dart';
import 'package:chat_app/views/register_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //     colorScheme: const ColorScheme(
      //         brightness: Brightness.light,
      //         primary: Color(0xff314F6A),
      //         onPrimary: Color(0xff314F6A),
      //         secondary: Color(0xff314F6A),
      //         onSecondary: Color(0xff314F6A),
      //         error: Color(0xff314F6A),
      //         onError: Color(0xff314F6A),
      //         background: Color(0xff314F6A),
      //         onBackground: Color(0xff314F6A),
      //         surface: Color(0xff314F6A),
      //         onSurface: Color(0xff314F6A))),
      routes: {
        'RegisterView': (context) => RegisterView(),
        'LoginView': (context) => LoginView()
      },
      initialRoute: 'LoginView',
    );
  }
}
