import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAEVfbAXqf7YRpVABfc6pEs-NMoCp-De68",
            authDomain: "healthcare-booking-app-489a9.firebaseapp.com",
            projectId: "healthcare-booking-app-489a9",
            storageBucket: "healthcare-booking-app-489a9.firebasestorage.app",
            messagingSenderId: "734891663081",
            appId: "1:734891663081:web:64390dbdfda969241cda78",
            measurementId: "G-MYE74J4XT4"));
  } else {
    await Firebase.initializeApp();
  }
}
