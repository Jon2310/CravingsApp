// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyA4mQ9xqG8nrn-0RIwRYbZY9DPKRwd7OQM',
    appId: '1:566170552280:web:587985fbf3219a4d0914ad',
    messagingSenderId: '566170552280',
    projectId: 'cacoethes-5fd13',
    authDomain: 'cacoethes-5fd13.firebaseapp.com',
    storageBucket: 'cacoethes-5fd13.appspot.com',
    measurementId: 'G-199GF7TYFD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAH20SzCwrWreBUiyQS3Cb_kCetzp07U_Y',
    appId: '1:566170552280:android:e20122ccc8a76d980914ad',
    messagingSenderId: '566170552280',
    projectId: 'cacoethes-5fd13',
    storageBucket: 'cacoethes-5fd13.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDCiMBttwSrhKOLPVMf6rOjtH9AFKm8zmU',
    appId: '1:566170552280:ios:9d797a049c5df7a50914ad',
    messagingSenderId: '566170552280',
    projectId: 'cacoethes-5fd13',
    storageBucket: 'cacoethes-5fd13.appspot.com',
    iosBundleId: 'edu.cpp.myFirstFlutterApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDCiMBttwSrhKOLPVMf6rOjtH9AFKm8zmU',
    appId: '1:566170552280:ios:79334e0587db531d0914ad',
    messagingSenderId: '566170552280',
    projectId: 'cacoethes-5fd13',
    storageBucket: 'cacoethes-5fd13.appspot.com',
    iosBundleId: 'edu.cpp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA4mQ9xqG8nrn-0RIwRYbZY9DPKRwd7OQM',
    appId: '1:566170552280:web:73a1b270563563ab0914ad',
    messagingSenderId: '566170552280',
    projectId: 'cacoethes-5fd13',
    authDomain: 'cacoethes-5fd13.firebaseapp.com',
    storageBucket: 'cacoethes-5fd13.appspot.com',
    measurementId: 'G-HTL8RXMRMC',
  );
}
