import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCvkuFqeeF161h0L05XPDuP7OEs-rla3eI",
            authDomain: "smart-homesyste-automat-osxhss.firebaseapp.com",
            projectId: "smart-homesyste-automat-osxhss",
            storageBucket: "smart-homesyste-automat-osxhss.appspot.com",
            messagingSenderId: "370748728220",
            appId: "1:370748728220:web:b300c8dd7dbd1774c75e59"));
  } else {
    await Firebase.initializeApp();
  }
}
