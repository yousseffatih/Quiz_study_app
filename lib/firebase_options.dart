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
    apiKey: 'AIzaSyBBQs9x7iJXeOX4iNTYol7j3UTji-nemrg',
    appId: '1:36760671653:web:b6f53a36605e7d86b0044c',
    messagingSenderId: '36760671653',
    projectId: 'quiz-study-app-cc1ea',
    authDomain: 'quiz-study-app-cc1ea.firebaseapp.com',
    storageBucket: 'quiz-study-app-cc1ea.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA9pTQknKMBOqwESbQb6U9T-fjgTlLKc8s',
    appId: '1:36760671653:android:c7016b9598c7bf3fb0044c',
    messagingSenderId: '36760671653',
    projectId: 'quiz-study-app-cc1ea',
    storageBucket: 'quiz-study-app-cc1ea.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA0d15XJ8alMVxZv_a2ptHdiyxepIfwVcA',
    appId: '1:36760671653:ios:7ef03bc90293fe46b0044c',
    messagingSenderId: '36760671653',
    projectId: 'quiz-study-app-cc1ea',
    storageBucket: 'quiz-study-app-cc1ea.appspot.com',
    iosClientId: '36760671653-oucun2mcbtmjg4hfkd21s56eia1adr86.apps.googleusercontent.com',
    iosBundleId: 'com.example.quizStudyApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA0d15XJ8alMVxZv_a2ptHdiyxepIfwVcA',
    appId: '1:36760671653:ios:a2a1504c2a159d8db0044c',
    messagingSenderId: '36760671653',
    projectId: 'quiz-study-app-cc1ea',
    storageBucket: 'quiz-study-app-cc1ea.appspot.com',
    iosClientId: '36760671653-dv6o2e5gr8nkhk4l8rtepo4c39u8j075.apps.googleusercontent.com',
    iosBundleId: 'com.example.quizStudyApp.RunnerTests',
  );
}
