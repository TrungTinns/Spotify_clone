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
    apiKey: 'AIzaSyAj1mupN8jWR1MMViT4LdTpd-OIZaRSwEQ',
    appId: '1:131212151253:web:5ae94b90d80d6c8ea5d55c',
    messagingSenderId: '131212151253',
    projectId: 'spotify-nrgtnns-001',
    authDomain: 'spotify-nrgtnns-001.firebaseapp.com',
    storageBucket: 'spotify-nrgtnns-001.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCWXYEMOz6oTCPwytRZEVNYX4Wfqj5QQDY',
    appId: '1:131212151253:android:cedefc2539a7e4caa5d55c',
    messagingSenderId: '131212151253',
    projectId: 'spotify-nrgtnns-001',
    storageBucket: 'spotify-nrgtnns-001.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBKkqS2Obn3ahmck92po7DLnbhqpEFqsqo',
    appId: '1:131212151253:ios:a459b21f1ba22e03a5d55c',
    messagingSenderId: '131212151253',
    projectId: 'spotify-nrgtnns-001',
    storageBucket: 'spotify-nrgtnns-001.firebasestorage.app',
    iosBundleId: 'com.example.spotifyClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBKkqS2Obn3ahmck92po7DLnbhqpEFqsqo',
    appId: '1:131212151253:ios:a459b21f1ba22e03a5d55c',
    messagingSenderId: '131212151253',
    projectId: 'spotify-nrgtnns-001',
    storageBucket: 'spotify-nrgtnns-001.firebasestorage.app',
    iosBundleId: 'com.example.spotifyClone',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAj1mupN8jWR1MMViT4LdTpd-OIZaRSwEQ',
    appId: '1:131212151253:web:9039aeb6b82de5c9a5d55c',
    messagingSenderId: '131212151253',
    projectId: 'spotify-nrgtnns-001',
    authDomain: 'spotify-nrgtnns-001.firebaseapp.com',
    storageBucket: 'spotify-nrgtnns-001.firebasestorage.app',
  );
}
