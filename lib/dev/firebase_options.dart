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
    apiKey: 'AIzaSyDXJ229XCpK0YutbEWFP7dh-m4RZZipLj8',
    appId: '1:239447220314:web:c743957e635b856d14f863',
    messagingSenderId: '239447220314',
    projectId: 'pas-nsspuri-dev',
    authDomain: 'pas-nsspuri-dev.firebaseapp.com',
    storageBucket: 'pas-nsspuri-dev.appspot.com',
    measurementId: 'G-E0PSPS23BM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBlhKMA9Hu5NfSOi-QUmTOCCFO4PP7wRMs',
    appId: '1:239447220314:android:6410539eb4c513c014f863',
    messagingSenderId: '239447220314',
    projectId: 'pas-nsspuri-dev',
    storageBucket: 'pas-nsspuri-dev.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyApypMKgIaI6bmF2GxQ_Z6QF5Xz9SHqsPM',
    appId: '1:239447220314:ios:6dce824c74fcdc3a14f863',
    messagingSenderId: '239447220314',
    projectId: 'pas-nsspuri-dev',
    storageBucket: 'pas-nsspuri-dev.appspot.com',
    iosClientId: '239447220314-a144gbm8p01ombqhqn5lc1ej528v2dvv.apps.googleusercontent.com',
    iosBundleId: 'com.example.prabasiAnchalikaSangha',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyApypMKgIaI6bmF2GxQ_Z6QF5Xz9SHqsPM',
    appId: '1:239447220314:ios:6dce824c74fcdc3a14f863',
    messagingSenderId: '239447220314',
    projectId: 'pas-nsspuri-dev',
    storageBucket: 'pas-nsspuri-dev.appspot.com',
    iosClientId: '239447220314-a144gbm8p01ombqhqn5lc1ej528v2dvv.apps.googleusercontent.com',
    iosBundleId: 'com.example.prabasiAnchalikaSangha',
  );
}