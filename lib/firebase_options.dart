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
    apiKey: 'AIzaSyBmZWYcju-o1TbLXJpxMz42jNEDtbG7rrM',
    appId: '1:156930580920:web:8478a856e327cfbd216f4d',
    messagingSenderId: '156930580920',
    projectId: 'oldgoose-4828c',
    authDomain: 'oldgoose-4828c.firebaseapp.com',
    storageBucket: 'oldgoose-4828c.appspot.com',
    measurementId: 'G-X1XMZ25HMB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCFBb0GsQCEO69Yk4_zEEzcWRvi-35cYvQ',
    appId: '1:156930580920:android:6fbbe6ddd6c915f5216f4d',
    messagingSenderId: '156930580920',
    projectId: 'oldgoose-4828c',
    storageBucket: 'oldgoose-4828c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCessd781-KYYaDECb9DN2VzV7Cz4Cb4E8',
    appId: '1:156930580920:ios:2f83733c85bbd00f216f4d',
    messagingSenderId: '156930580920',
    projectId: 'oldgoose-4828c',
    storageBucket: 'oldgoose-4828c.appspot.com',
    iosClientId: '156930580920-1orr1g15l19m9k3edj4kg1q0c6pgh2oc.apps.googleusercontent.com',
    iosBundleId: 'com.example.oldGoose',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCessd781-KYYaDECb9DN2VzV7Cz4Cb4E8',
    appId: '1:156930580920:ios:2f83733c85bbd00f216f4d',
    messagingSenderId: '156930580920',
    projectId: 'oldgoose-4828c',
    storageBucket: 'oldgoose-4828c.appspot.com',
    iosClientId: '156930580920-1orr1g15l19m9k3edj4kg1q0c6pgh2oc.apps.googleusercontent.com',
    iosBundleId: 'com.example.oldGoose',
  );
}
