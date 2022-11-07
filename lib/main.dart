import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/pages/home_page.dart';
import 'package:bnacash/pages/login/models/country.dart';
import 'package:bnacash/pages/login/proof_of_residency.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:bnacash/pages/premium.dart';
import 'package:bnacash/card_design.dart';
import 'package:bnacash/pages/login/landing_page.dart';
import 'package:get/get.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var userId = FirebaseAuth.instance.currentUser;
    
    return GetMaterialApp(

      title: 'BNA Cash',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Montserrat',
        primaryColor: kBackgroundColor,
        scaffoldBackgroundColor: kBackgroundColor,
        appBarTheme: const AppBarTheme(color: kBackgroundColor),
        iconTheme: const IconThemeData(color: kPrimaryColor),
        textTheme: Theme.of(context)
            .textTheme
            .apply(fontFamily: 'Montserrat', bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: userId !=null ? 
      const HomePage(): LandingPage()
      // const CountryField(),
      // const ProofPage()
    );
  }
}
