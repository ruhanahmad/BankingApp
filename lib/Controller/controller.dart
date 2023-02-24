import 'dart:async';

import 'package:bnacash/main.dart';
import 'package:bnacash/pages/home_page.dart';
import 'package:bnacash/pages/login/models/code_feild_login.dart';
import 'package:bnacash/pages/login/models/dob.dart';
import 'package:bnacash/pages/login/models/phone_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../pages/Login/models/code_field.dart';




class PhoneAuth extends GetxController {
  String? verificationCode;
  String verify ="";
  String? phoneNumbers;
   var pinCode = "";
Future  verifyPhone() async {
    Get.snackbar("Code sent","Code Sent Successfully");
    await FirebaseAuth.instance.verifyPhoneNumber(
  phoneNumber:"+" + phoneNumbers!,
  verificationCompleted: (PhoneAuthCredential credential) {},
  verificationFailed: (FirebaseAuthException e) {
    Get.snackbar("Error", "Verification Failed");
    // Get.to(PhoneField());
  },
  codeSent: (String verificationId, int? resendToken) {
     verify = verificationId;
     update();
   userController.signUps == true?
    Get.to(CodeField()) 
    :Get.to(CodeFieldLogin());

  },
  codeAutoRetrievalTimeout: (String verificationId) {});
  }


    verifyPhoneAgain() async {

      Get.snackbar("Code sent","Code Sent Successfully");
    await FirebaseAuth.instance.verifyPhoneNumber(
  phoneNumber:"+" +phoneNumbers!,
  verificationCompleted: (PhoneAuthCredential credential) {},
  verificationFailed: (FirebaseAuthException e) {},
  codeSent: (String verificationId, int? resendToken) {
     verify = verificationId;
     update();

  

  },
  codeAutoRetrievalTimeout: (String verificationId) {});
  }
        // phoneNumber: '+92${widget.phone}',
        // phoneNumber: "+923059604250",
        // verificationCompleted: (PhoneAuthCredential credential) async {
        //   await FirebaseAuth.instance
        //       .signInWithCredential(credential)
        //       .then((value) async {
        //     if (value.user != null) {
        //       // Navigator.pushAndRemoveUntil(
        //       //     context,
        //       //     MaterialPageRoute(builder: (context) => Home()),
        //       //         (route) => false);

        //       Get.to(CodeField());

        //     }
        //   });
        // },
        // verificationFailed: (FirebaseAuthException e) {
        //   print(e.message);
        // },
        // codeSent: (String? verficationID, int? resendToken) {

        //     verificationCode = verficationID;
        //     update();

        // },
        // codeAutoRetrievalTimeout: (String verificationID) {

        //     verificationCode = verificationID;
        //     update();

        // },
        // timeout: Duration(seconds: 120));
  

// static PhoneAuth? to = Get.find();
  //   final start = 30.obs;
  // final mcount = 0.obs;
  // final wait = false.obs;
  //
  // final verificationIdFinal = "".obs;
  // final smsVerificationCode=''.obs;
  // final countryCode = '+92'.obs;
  //   void setData(String verificationId) {
  //
  //     verificationIdFinal.value = verificationId;
  //
  //   startTimer();
  // }
  //
  // startTimer() {
  //   const onsec = Duration(seconds: 1);
  //   Timer _timer = Timer.periodic(onsec, (timer) {
  //     if (start == 0) {
  //
  //         timer.cancel();
  //         wait.value = false;
  //
  //     } else {
  //
  //         start.value--;
  //
  //     }
  //     update();
  //   });
  // }
  //    final FirebaseAuth? _auth = FirebaseAuth.instance;
  // final FirebaseFirestore? _db = FirebaseFirestore.instance;
  // final FirebaseFirestore? db = FirebaseFirestore.instance;
  // verifyPhoneNumber(
  //     String phoneNumber, BuildContext context) async {
  //   PhoneVerificationCompleted verificationCompleted =
  //       (PhoneAuthCredential phoneAuthCredential) async {
  //
  //     Get.snackbar('Verification Completed', '',
  //         snackPosition: SnackPosition.BOTTOM,
  //         duration: Duration(seconds: 7),
  //         backgroundColor: Get.theme.snackBarTheme.backgroundColor,
  //         colorText: Get.theme.snackBarTheme.actionTextColor);
  //   };
  //   PhoneVerificationFailed verificationFailed =
  //       (FirebaseAuthException exception) {
  //
  //     Get.snackbar(exception.toString(), '',
  //         snackPosition: SnackPosition.BOTTOM,
  //         duration: Duration(seconds: 7),
  //         backgroundColor: Get.theme.snackBarTheme.backgroundColor,
  //         colorText: Get.theme.snackBarTheme.actionTextColor);
  //   };
  //   PhoneCodeSent? codeSent =
  //       (String verificationID, [int? forceResnedingtoken]) {
  //     Get.snackbar('Verification Code sent on the phone number', '',
  //         snackPosition: SnackPosition.BOTTOM,
  //         duration: Duration(seconds: 7),
  //         backgroundColor: Get.theme.snackBarTheme.backgroundColor,
  //         colorText: Get.theme.snackBarTheme.actionTextColor);
  //     setData(verificationID);
  //   };
  //
  //   PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
  //       (String verificationID) {
  //
  //     Get.snackbar('Time out', '',
  //         snackPosition: SnackPosition.BOTTOM,
  //         duration: Duration(seconds: 7),
  //         backgroundColor: Get.theme.snackBarTheme.backgroundColor,
  //         colorText: Get.theme.snackBarTheme.actionTextColor);
  //   };
  //   try {
  //     await _auth!.verifyPhoneNumber(
  //         timeout: Duration(seconds: 60),
  //         phoneNumber: phoneNumber,
  //         verificationCompleted: verificationCompleted,
  //         verificationFailed: verificationFailed,
  //         codeSent: codeSent,
  //         codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  //   } catch (e) {
  //     Get.snackbar(e.toString(), '',
  //         snackPosition: SnackPosition.BOTTOM,
  //         duration: Duration(seconds: 7),
  //         backgroundColor: Get.theme.snackBarTheme.backgroundColor,
  //         colorText: Get.theme.snackBarTheme.actionTextColor);
  //
  //   }
  // }
}