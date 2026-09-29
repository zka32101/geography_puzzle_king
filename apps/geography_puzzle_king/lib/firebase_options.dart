import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'dart:io';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (Platform.isAndroid) {
      return android;
    }
    if (Platform.isIOS) {
      return ios;
    }
    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC97KS0mXf-Wr4nlGLg_bzhfuhiyNclPJk',
    appId: '1:453130253031:android:1322c313d89e56cda3a842',
    messagingSenderId: '453130253031',
    projectId: 'geography-puzzle-king-app',
    storageBucket: 'geography-puzzle-king-app.firebasestorage.app',
  );
  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC4gaFcLxN8iT7xm6JeIM7Iou-efE5g5SM',
    appId: '1:946448575860:ios:e59a3ae6f5fba47237d021',
    messagingSenderId: '946448575860',
    projectId: 'apps2-752cb',
    storageBucket: 'apps2-752cb.firebasestorage.app',
    iosBundleId: 'com..nihonryoudodefence',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBLU_example_key_REPLACE_WITH_REAL_KEY',
    appId: '1:123456789:web:abcdef123456',
    messagingSenderId: '123456789',
    projectId: 'geography-puzzle-king',
    authDomain: 'geography-puzzle-king.firebaseapp.com',
    databaseURL: 'https://geography-puzzle-king.firebaseio.com',
    storageBucket: 'geography-puzzle-king.appspot.com',
  );
}
