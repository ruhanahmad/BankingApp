// ignore_for_file: unnecessary_new

import 'dart:async';

import 'package:bnacash/Controller/controller.dart';
import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/models/primary_button.dart';
import 'package:bnacash/pages/home_page.dart';
import 'package:bnacash/pages/login/models/country.dart';
import 'package:bnacash/pages/login/models/dob.dart';
import 'package:bnacash/pages/login/personal_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pinput/pinput.dart';
class CodeField extends StatefulWidget {
   CodeField({Key? key,}) : super(key: key);
 
  @override
  _CodeFieldState createState() => _CodeFieldState();
}

class _CodeFieldState extends State<CodeField> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _keyLogin = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();
  PhoneAuth phoneAuth = Get.put(PhoneAuth());
  // StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";

  String fullCode = "";

  Timer? _timer;
  int _start = 30;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }
   final TextEditingController _pinPutController = TextEditingController();


  final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  var pinCode;
  Widget textField() {
    return Form(
      key: _keyLogin,
      child: Material(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child:
            Pinput(
              length: 6,
              defaultPinTheme: defaultPinTheme,
      
              controller: _pinPutController,
                androidSmsAutofillMethod:  AndroidSmsAutofillMethod.smsRetrieverApi,
              pinAnimationType: PinAnimationType.fade,
              onSubmitted: (pin)  {
                setState(() {
                   pinCode =   pin;
                });
             
              
                // try {
                //   await FirebaseAuth.instance
                //       .signInWithCredential(PhoneAuthProvider.credential(
                //       verificationId: phoneAuth.verificationCode!, smsCode: pin))
                //       .then((value) async {
                //     if (value.user != null) {
                //       Navigator.pushAndRemoveUntil(
                //           context,
                //           MaterialPageRoute(builder: (context) =>  PersonalInfo()),
                //               (route) => false);
                //     }
                //   });
                // } catch (e) {
                //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      
                // }
              },
            ),
            // PinCodeTextField(
            //   backgroundColor: kBackgroundColor,
            //   appContext: context,
            //   pastedTextStyle: TextStyle(
            //     color: Colors.green.shade600,
            //     fontWeight: FontWeight.bold,
            //   ),
            //   length: 6,
            //   obscureText: true,
            //   obscuringCharacter: '*',
            //   // obscuringWidget: Image(
            //   //   image: AssetImage('assets/icons/icon.png'),
            //   // ),
            //   blinkWhenObscuring: true,
            //   animationType: AnimationType.fade,
            //   validator: (v) {
            //     if (v!.length < 4) {
            //       return "Enter Correct Code";
            //     } else {
            //       return null;
            //     }
            //   },
            //   pinTheme: PinTheme(
            //     disabledColor: Colors.yellow,
            //     inactiveFillColor: kPrimaryColor.withOpacity(0.5),
            //     selectedColor: kPrimaryColor,
            //     selectedFillColor: kPrimaryColor,
            //     activeColor: kPrimaryColor,
            //     inactiveColor: Colors.transparent,
            //     shape: PinCodeFieldShape.box,
            //     borderRadius: BorderRadius.circular(15),
            //     fieldHeight: 70,
            //     fieldWidth: 60,
            //     activeFillColor: hasError
            //         ? Colors.red.shade400
            //         : kPrimaryColor.withOpacity(0.5),
            //   ),
            //   cursorColor: Colors.black,
            //   animationDuration: const Duration(milliseconds: 300),
            //   enableActiveFill: true,
            //   errorAnimationController: errorController,
            //   controller: textEditingController,
            //   keyboardType: TextInputType.number,
            //   boxShadows: const [
            //     BoxShadow(
            //       offset: Offset(5, 5),
            //       color: Colors.black12,
            //       blurRadius: 10,
            //     )
            //   ],
            //   onCompleted: (val) {
            //     setState(() {
            //       fullCode = val;
            //     });
            //   },
            //   // onTap: () {
            //   //   print("Pressed");
            //   // },
            //   onChanged: (value) {
            //     setState(() {
            //       currentText = value;
            //     });
            //   },
            //   beforeTextPaste: (text) {
            //     return true;
            //   },
            // )
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
     body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "6-Digit Code",
              style: kAppBarTextStyle.copyWith(fontSize: 25),
            ),
            const SizedBox(height: 10),
            Text(
              " Enter the code you received on number + ${phoneAuth.phoneNumbers}",
              style: kContentTextStyle,
            ),
            const SizedBox(height: 20),
            textField(),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
phoneAuth.verifyPhoneAgain();
              },
              child: Text(
                _start > 9
                    ? "Resend the Code in 00 : $_start"
                    : _start != 0
                        ? "Resend the Code in 00 : 0$_start"
                        : "Resend the Code",
                style: kContentTextStyle.copyWith(color: kPrimaryColor),
              ),
            ),
            const Spacer(),
            PrimaryButton(
              text: "Confirm",
              onPressed: () async {
              // phoneAuth.verifyPhone();
                     try {
                 PhoneAuthCredential credential = await PhoneAuthProvider.credential(verificationId: phoneAuth.verify, smsCode:_pinPutController.text);
    
      // Sign the user in (or link) with the credential
      await auth.signInWithCredential(credential);
           userController.signUps == true?  
   Get.to(CountryField())  :
   Get.to(HomePage()) ;
      // await userController.checksIF();
     
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("The number is incorrect")));
      
                }
              
                // Navigator.push(
                //     context,
                //     PageRouteBuilder(
                //         transitionDuration: const Duration(milliseconds: 1000),
                //         transitionsBuilder: (BuildContext context,
                //             Animation<double> animation,
                //             Animation<double> secondaryAnimation,
                //             Widget child) {
                //           animation = CurvedAnimation(
                //               parent: animation, curve: Curves.elasticInOut);
                //           return ScaleTransition(
                //             alignment: Alignment.center,
                //             scale: animation,
                //             child: child,
                //           );
                //         },
                //         pageBuilder: (BuildContext context,
                //             Animation<double> animation,
                //             Animation<double> secondaryAnimation) {
                //           return const PersonalInfo();
                //         }));
              },
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
