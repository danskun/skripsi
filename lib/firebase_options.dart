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
    apiKey: 'AIzaSyCaPCRaDoHOfvIElJjWdEmMh4ZoAUXlqlQ',
    appId: '1:1021058580032:web:1102be298214cff00369a5',
    messagingSenderId: '1021058580032',
    projectId: 'jakeats-skripsi',
    authDomain: 'jakeats-skripsi.firebaseapp.com',
    databaseURL: 'https://jakeats-skripsi-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'jakeats-skripsi.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDsVSh3aMosZDksiMVrw2Keu-iVcJ-Nkqw',
    appId: '1:1021058580032:android:ac68cf20d686421d0369a5',
    messagingSenderId: '1021058580032',
    projectId: 'jakeats-skripsi',
    databaseURL: 'https://jakeats-skripsi-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'jakeats-skripsi.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB6IniddenrQFag6nGaR-wMgSjJUM3x_Fo',
    appId: '1:1021058580032:ios:2d636dbf7d821a610369a5',
    messagingSenderId: '1021058580032',
    projectId: 'jakeats-skripsi',
    databaseURL: 'https://jakeats-skripsi-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'jakeats-skripsi.appspot.com',
    iosBundleId: 'com.example.skripsi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB6IniddenrQFag6nGaR-wMgSjJUM3x_Fo',
    appId: '1:1021058580032:ios:e6929016eb9373fc0369a5',
    messagingSenderId: '1021058580032',
    projectId: 'jakeats-skripsi',
    databaseURL: 'https://jakeats-skripsi-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'jakeats-skripsi.appspot.com',
    iosBundleId: 'com.example.skripsi.RunnerTests',
  );
}
