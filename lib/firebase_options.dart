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
    apiKey: 'AIzaSyA82EIlqPXjsW3oNvTGwT05boAr3OqTvsM',
    appId: '1:718431638537:web:bd3a639e5797643cfb94d8',
    messagingSenderId: '718431638537',
    projectId: 'whisper-9ab73',
    authDomain: 'whisper-9ab73.firebaseapp.com',
    storageBucket: 'whisper-9ab73.appspot.com',
    measurementId: 'G-S1F4WK4Z7J',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCsRg2bZlsBdr2dSzzLvMBnmvv0m6WPxdw',
    appId: '1:718431638537:android:014325c09245624efb94d8',
    messagingSenderId: '718431638537',
    projectId: 'whisper-9ab73',
    storageBucket: 'whisper-9ab73.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyANhj-9tSzU3dCdgqzRNsTClepT0-J9gKo',
    appId: '1:718431638537:ios:e3d237252b10861dfb94d8',
    messagingSenderId: '718431638537',
    projectId: 'whisper-9ab73',
    storageBucket: 'whisper-9ab73.appspot.com',
    iosBundleId: 'com.example.whisper',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyANhj-9tSzU3dCdgqzRNsTClepT0-J9gKo',
    appId: '1:718431638537:ios:e3d237252b10861dfb94d8',
    messagingSenderId: '718431638537',
    projectId: 'whisper-9ab73',
    storageBucket: 'whisper-9ab73.appspot.com',
    iosBundleId: 'com.example.whisper',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA82EIlqPXjsW3oNvTGwT05boAr3OqTvsM',
    appId: '1:718431638537:web:5e412693cd3eb3fbfb94d8',
    messagingSenderId: '718431638537',
    projectId: 'whisper-9ab73',
    authDomain: 'whisper-9ab73.firebaseapp.com',
    storageBucket: 'whisper-9ab73.appspot.com',
    measurementId: 'G-QYT3WRE726',
  );

}