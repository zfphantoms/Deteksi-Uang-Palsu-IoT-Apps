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
    apiKey: 'AIzaSyCvbsxY4h8ZesTYOEdxIEmXEjkOy-r3xeo',
    appId: '1:182288120841:web:6aa1370c928453cf30ccd8',
    messagingSenderId: '182288120841',
    projectId: 'deteksi-uang-app',
    authDomain: 'deteksi-uang-app.firebaseapp.com',
    databaseURL: 'https://deteksi-uang-app-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'deteksi-uang-app.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBefp2h9dDoUk08jkuDJ2JBE32ipCtNesM',
    appId: '1:182288120841:android:2cfee5f68ebc477e30ccd8',
    messagingSenderId: '182288120841',
    projectId: 'deteksi-uang-app',
    databaseURL: 'https://deteksi-uang-app-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'deteksi-uang-app.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD4-G3dkpm8vFW_EVUImNOK6O25YlHMYLw',
    appId: '1:182288120841:ios:2aea5167c142210930ccd8',
    messagingSenderId: '182288120841',
    projectId: 'deteksi-uang-app',
    databaseURL: 'https://deteksi-uang-app-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'deteksi-uang-app.firebasestorage.app',
    iosBundleId: 'com.example.iotCekUangPalsu',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD4-G3dkpm8vFW_EVUImNOK6O25YlHMYLw',
    appId: '1:182288120841:ios:2aea5167c142210930ccd8',
    messagingSenderId: '182288120841',
    projectId: 'deteksi-uang-app',
    databaseURL: 'https://deteksi-uang-app-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'deteksi-uang-app.firebasestorage.app',
    iosBundleId: 'com.example.iotCekUangPalsu',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCvbsxY4h8ZesTYOEdxIEmXEjkOy-r3xeo',
    appId: '1:182288120841:web:90313bcd7bfa654830ccd8',
    messagingSenderId: '182288120841',
    projectId: 'deteksi-uang-app',
    authDomain: 'deteksi-uang-app.firebaseapp.com',
    databaseURL: 'https://deteksi-uang-app-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'deteksi-uang-app.firebasestorage.app',
  );
}
