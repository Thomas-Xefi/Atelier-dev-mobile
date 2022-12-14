import 'package:atelier/data/bindings/authentification_bindings.dart';
import 'package:atelier/ui/view/login_page_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:atelier/ui/view/basket_page.dart';
import 'package:atelier/ui/view/catalogue_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'data/bindings/basket_bindings.dart';
import 'data/bindings/catalogue_bindings.dart';

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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BuyMyCar',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      getPages: [
        GetPage(
          name: '/catalogue',
          page: () => const CataloguePageView(),
          binding: CatalogueBindings(),
        ),
        GetPage(
          name: '/basket',
          page: () => const BasketPage(),
          binding: BasketBindings(),
        ),
        GetPage(
          name: '/login',
          page: () => LoginPage(),
          binding: AuthentificationBindings(),
        ),
      ],
      initialRoute: ('/catalogue'),
    );
  }
}
