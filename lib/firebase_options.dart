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
    apiKey: 'AIzaSyAIKy8k2ERl40d4KGJteU-y27AhCrv4tYY',
    appId: '1:693119765881:web:865bb29d453051fce973a8',
    messagingSenderId: '693119765881',
    projectId: 'coffee-app-72c35',
    authDomain: 'coffee-app-72c35.firebaseapp.com',
    storageBucket: 'coffee-app-72c35.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCsfk_wqvp6mfbFHHLRyMY0ghNuVf9EFoM',
    appId: '1:693119765881:android:aad5ed562a79f509e973a8',
    messagingSenderId: '693119765881',
    projectId: 'coffee-app-72c35',
    storageBucket: 'coffee-app-72c35.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAoEctiJnl2HDa5Y9JY-XlvMRen9-TQnm0',
    appId: '1:693119765881:ios:37563d1a32977b33e973a8',
    messagingSenderId: '693119765881',
    projectId: 'coffee-app-72c35',
    storageBucket: 'coffee-app-72c35.appspot.com',
    iosBundleId: 'com.example.coffeeApp',
  );
}
