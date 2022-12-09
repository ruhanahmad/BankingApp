

import 'package:bnacash/main.dart';
import 'package:bnacash/pages/home_page.dart';
import 'package:bnacash/pages/login/models/dob.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';



class VerificationFailed extends StatefulWidget {
  const VerificationFailed({Key? key}) : super(key: key);

  @override
  State<VerificationFailed> createState() => _VerificationFailedState();
}

class _VerificationFailedState extends State<VerificationFailed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verification Feild"),
        
      ),
      
      body: Center(child: Container(
      child: Column(
        children: [
          Text("It need to be verified first"),
          GestureDetector(
            onTap: () async{
              print("object");
   bool? newone = await userController.verificationChec();
         Nav.toScreen(context, const HomePage());
            },
            child: Text("Check again"))
        ],
      ),
    )));
  }
}