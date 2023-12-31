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
    apiKey: 'AIzaSyB8890Dz0Mc0ZIHTj_GdOLWQn3ybUVS53Q',
    appId: '1:531526601910:web:32705342512e8d3b5a2a17',
    messagingSenderId: '531526601910',
    projectId: 'discipulando-964a2',
    authDomain: 'discipulando-964a2.firebaseapp.com',
    storageBucket: 'discipulando-964a2.appspot.com',
    measurementId: 'G-Q3VKZGPS3S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCuqPsZZEGCUXUbPVf9yYYhvvWJRfMQ_wA',
    appId: '1:531526601910:android:9a91a728c7d005455a2a17',
    messagingSenderId: '531526601910',
    projectId: 'discipulando-964a2',
    storageBucket: 'discipulando-964a2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBFvMj9NkNOmY6PanWIzNzDBC7zyAeJBMw',
    appId: '1:531526601910:ios:be2e14d3e5bf6fae5a2a17',
    messagingSenderId: '531526601910',
    projectId: 'discipulando-964a2',
    storageBucket: 'discipulando-964a2.appspot.com',
    iosBundleId: 'com.example.discipulando',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBFvMj9NkNOmY6PanWIzNzDBC7zyAeJBMw',
    appId: '1:531526601910:ios:564e0e6a9182cfc25a2a17',
    messagingSenderId: '531526601910',
    projectId: 'discipulando-964a2',
    storageBucket: 'discipulando-964a2.appspot.com',
    iosBundleId: 'com.example.discipulando.RunnerTests',
  );
}
