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
    apiKey: 'AIzaSyCdIuk0UifwgliMGDdU-06TwUsvkJESPc0',
    appId: '1:250444577503:android:a09c016319d25f05c1476a',
    messagingSenderId: '250444577503',
    projectId: 'petit-works-games',
    databaseURL: 'https://petit-works-games-default-rtdb.asia-southeast1.firebasedatabase.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBLU_example_key_REPLACE_WITH_REAL_KEY',
    appId: '1:123456789:ios:abcdef123456',
    messagingSenderId: '123456789',
    projectId: 'geography-puzzle-king',
    databaseURL: 'https://geography-puzzle-king.firebaseio.com',
    iosBundleId: 'com.petitworks.geographyPuzzleKing',
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
