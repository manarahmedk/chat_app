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
    apiKey: 'AIzaSyBItiHBSz4GhP4YTeZbNnWI6TFYKVPhFv8',
    appId: '1:408809360377:web:1eb89dcee9a8a6b3f94b28',
    messagingSenderId: '408809360377',
    projectId: 'chat-app-15116',
    authDomain: 'chat-app-15116.firebaseapp.com',
    storageBucket: 'chat-app-15116.appspot.com',
    measurementId: 'G-8BZ40T0R1K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAHzJTQ8nfkZ2o7qLsgXP-hNkHdEwpelMA',
    appId: '1:408809360377:android:d3e458001cab504df94b28',
    messagingSenderId: '408809360377',
    projectId: 'chat-app-15116',
    storageBucket: 'chat-app-15116.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDMOyHRq4n0pRb3oN1fZPGGB-woVN3Zr7E',
    appId: '1:408809360377:ios:c692329d89b30232f94b28',
    messagingSenderId: '408809360377',
    projectId: 'chat-app-15116',
    storageBucket: 'chat-app-15116.appspot.com',
    iosBundleId: 'com.eraasoft.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDMOyHRq4n0pRb3oN1fZPGGB-woVN3Zr7E',
    appId: '1:408809360377:ios:bfee61b4807eaf47f94b28',
    messagingSenderId: '408809360377',
    projectId: 'chat-app-15116',
    storageBucket: 'chat-app-15116.appspot.com',
    iosBundleId: 'com.eraasoft.chatApp.RunnerTests',
  );
}
