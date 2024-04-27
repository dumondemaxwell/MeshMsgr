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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAykbaRHck6KsbK7X4wwU7wyuroatxA84I',
    appId: '1:213633885192:android:ba6a853559f178deb51dbd',
    messagingSenderId: '213633885192',
    projectId: 'mesh-a9c08',
    storageBucket: 'mesh-a9c08.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDYDQiB8fM-RUIfOrUvUwiqCOKmX0jTemo',
    appId: '1:213633885192:ios:c8c0351c9d89d243b51dbd',
    messagingSenderId: '213633885192',
    projectId: 'mesh-a9c08',
    storageBucket: 'mesh-a9c08.appspot.com',
    iosBundleId: 'com.example.meshMsgr',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDYDQiB8fM-RUIfOrUvUwiqCOKmX0jTemo',
    appId: '1:213633885192:ios:c8c0351c9d89d243b51dbd',
    messagingSenderId: '213633885192',
    projectId: 'mesh-a9c08',
    storageBucket: 'mesh-a9c08.appspot.com',
    iosBundleId: 'com.example.meshMsgr',
  );
}
