import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB5TedHvCY6oD3Mybl8N5e5FMTjux_Zxjw",
            authDomain: "traduz-demo-6nnt4l.firebaseapp.com",
            projectId: "traduz-demo-6nnt4l",
            storageBucket: "traduz-demo-6nnt4l.firebasestorage.app",
            messagingSenderId: "343016542821",
            appId: "1:343016542821:web:caf7c59f197522ab2c2c8c"));
  } else {
    await Firebase.initializeApp();
  }
}
