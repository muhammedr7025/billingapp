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
    apiKey: 'AIzaSyB5nQBUY4QpOv_UlvZdy0Zd3YU2OpX7Oik',
    appId: '1:979118426228:web:8b33d8b0b605928f806921',
    messagingSenderId: '979118426228',
    projectId: 'matrix-billing',
    authDomain: 'matrix-billing.firebaseapp.com',
    storageBucket: 'matrix-billing.appspot.com',
    measurementId: 'G-2HCHWF3G27',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBQoG0ODH0xP2p720MqERXwun-tN5mb_0g',
    appId: '1:979118426228:android:89b8057f2bbf8cab806921',
    messagingSenderId: '979118426228',
    projectId: 'matrix-billing',
    storageBucket: 'matrix-billing.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAyW6zKhnkk6NfJjxnFAdusyBKBhsyO8UI',
    appId: '1:979118426228:ios:74c0c07ca0e7cba4806921',
    messagingSenderId: '979118426228',
    projectId: 'matrix-billing',
    storageBucket: 'matrix-billing.appspot.com',
    iosClientId: '979118426228-pgjtgmlj5curo4ht5q0bclulpnhajsev.apps.googleusercontent.com',
    iosBundleId: 'com.example.billingapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAyW6zKhnkk6NfJjxnFAdusyBKBhsyO8UI',
    appId: '1:979118426228:ios:74c0c07ca0e7cba4806921',
    messagingSenderId: '979118426228',
    projectId: 'matrix-billing',
    storageBucket: 'matrix-billing.appspot.com',
    iosClientId: '979118426228-pgjtgmlj5curo4ht5q0bclulpnhajsev.apps.googleusercontent.com',
    iosBundleId: 'com.example.billingapp',
  );
}