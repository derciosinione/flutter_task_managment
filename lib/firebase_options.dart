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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAL-gydJh2sLSf996LS7BnYC7qHcPeXzjM',
    appId: '1:616641912323:web:05a2407c5d5575668ab836',
    messagingSenderId: '616641912323',
    projectId: 'improjectmanagmentipcb',
    authDomain: 'improjectmanagmentipcb.firebaseapp.com',
    storageBucket: 'improjectmanagmentipcb.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDXdC4Lhun7YR1Npj6-FoR39szEzT1xX0Y',
    appId: '1:616641912323:android:1007f11d7756acd78ab836',
    messagingSenderId: '616641912323',
    projectId: 'improjectmanagmentipcb',
    storageBucket: 'improjectmanagmentipcb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCmQeEvf5jRPvvl5tF3_WnTCiEEw-H50Kg',
    appId: '1:616641912323:ios:8adbb495529625578ab836',
    messagingSenderId: '616641912323',
    projectId: 'improjectmanagmentipcb',
    storageBucket: 'improjectmanagmentipcb.appspot.com',
    iosBundleId: 'com.example.imTaskManagment',
  );
}
