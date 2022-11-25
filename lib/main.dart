
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:atelier/basket_page.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDZg9vr_ESsC9bnOzg_upD78A8yu-EPWHw",
            authDomain: "atelier-dev-mobile.firebaseapp.com",
            appId: "1:762403803198:web:5c5614ad460771cd13c16f",
            messagingSenderId: "762403803198",
            storageBucket: "atelier-dev-mobile.appspot.com",
            projectId: "atelier-dev-mobile"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BasketPage(),
    );
  }
}
