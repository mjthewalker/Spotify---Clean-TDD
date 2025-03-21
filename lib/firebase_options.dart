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
    apiKey: 'AIzaSyChTSQ0vYPRAGZY0M8mg2JURAqnm9u7Vf0',
    appId: '1:1095155244422:web:ae224c65cb93b44e772007',
    messagingSenderId: '1095155244422',
    projectId: 'spotify-d7682',
    authDomain: 'spotify-d7682.firebaseapp.com',
    storageBucket: 'spotify-d7682.firebasestorage.app',
    measurementId: 'G-MQK6YKXX6H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCUAFDcWDTbVDvEMiWN0hlzSF_BCivuyd8',
    appId: '1:1095155244422:android:6ebe3372f6596342772007',
    messagingSenderId: '1095155244422',
    projectId: 'spotify-d7682',
    storageBucket: 'spotify-d7682.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBnYdV16wj8y9iqnIm4PdVmonFnVf0KjVc',
    appId: '1:1095155244422:ios:258374e845562124772007',
    messagingSenderId: '1095155244422',
    projectId: 'spotify-d7682',
    storageBucket: 'spotify-d7682.firebasestorage.app',
    iosBundleId: 'com.example.spotify',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBnYdV16wj8y9iqnIm4PdVmonFnVf0KjVc',
    appId: '1:1095155244422:ios:258374e845562124772007',
    messagingSenderId: '1095155244422',
    projectId: 'spotify-d7682',
    storageBucket: 'spotify-d7682.firebasestorage.app',
    iosBundleId: 'com.example.spotify',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyChTSQ0vYPRAGZY0M8mg2JURAqnm9u7Vf0',
    appId: '1:1095155244422:web:be040850e472dc0d772007',
    messagingSenderId: '1095155244422',
    projectId: 'spotify-d7682',
    authDomain: 'spotify-d7682.firebaseapp.com',
    storageBucket: 'spotify-d7682.firebasestorage.app',
    measurementId: 'G-SZEM2ZBGBQ',
  );
}
