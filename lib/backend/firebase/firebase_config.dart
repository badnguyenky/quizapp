import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDSDfpPzmDMeK8Zg8yFIDnFjJCtl8Ap-iQ",
            authDomain: "quizapp-6a2ed.firebaseapp.com",
            projectId: "quizapp-6a2ed",
            storageBucket: "quizapp-6a2ed.appspot.com",
            messagingSenderId: "951498502876",
            appId: "1:951498502876:web:60706d926bd1d701587a19",
            measurementId: "G-G08LTPXCTJ"));
  } else {
    await Firebase.initializeApp();
  }
}
