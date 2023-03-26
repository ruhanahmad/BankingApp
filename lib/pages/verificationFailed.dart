

import 'package:bnacash/Controller/userController.dart';
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
  UserController userController = Get.put(UserController());
   bool? newone ;
  @override
  void initState() {
       userController.verificationChec();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verification Feild"),
        
      ),
      
      body: Center(child: Container(
      child: Column(
        children: [
          userController.firstScreen == true ?
           Nav.toScreen(context, const HomePage()):
          Text("It need to be verified first"),
          SizedBox(height: 20,),
          GestureDetector(
            onTap: () async{
              print("object");
  await userController.verificationChec();
     userController.firstScreen == false ?
         Get.snackbar("Not Verified", "Ask admin to make Verified true")
         
         :
          Nav.toScreen(context, const HomePage())
         ;
            },
            
            child: Container(
              height: 30,
              width: 80,
              
              color: Colors.green,
              
              child: Center(child: Text("Check again",))))
        ],
      ),
    )));
  }
}