// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC8z_LELHAFXVrkZgJrHWt8iL-mFtIByEo',
    appId: '1:314136230387:web:1993b79fc243e0e86fba86',
    messagingSenderId: '314136230387',
    projectId: 'chat-app-ff7b0',
    authDomain: 'chat-app-ff7b0.firebaseapp.com',
    storageBucket: 'chat-app-ff7b0.appspot.com',
    measurementId: 'G-E5KGYZ4F37',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyANFnPzTnwEOu2U8WE7kM8fyPdz7auhTBY',
    appId: '1:314136230387:android:4ae0930a3d8024286fba86',
    messagingSenderId: '314136230387',
    projectId: 'chat-app-ff7b0',
    storageBucket: 'chat-app-ff7b0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCGQXk_drtRmxq-O8KpN1W56IvLQiLmkzc',
    appId: '1:314136230387:ios:794f79a31804dfa86fba86',
    messagingSenderId: '314136230387',
    projectId: 'chat-app-ff7b0',
    storageBucket: 'chat-app-ff7b0.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCGQXk_drtRmxq-O8KpN1W56IvLQiLmkzc',
    appId: '1:314136230387:ios:340e9add9801b60c6fba86',
    messagingSenderId: '314136230387',
    projectId: 'chat-app-ff7b0',
    storageBucket: 'chat-app-ff7b0.appspot.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}
