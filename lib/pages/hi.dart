import 'dart:async';

import 'package:bnacash/Controller/userController.dart';
import 'package:bnacash/pages/home_page.dart';
import 'package:bnacash/pages/whom_to_pay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:passcode_screen/passcode_screen.dart';

import '../constants/constants.dart';





class ExampleHomePage extends StatefulWidget {
  ExampleHomePage({Key? key,this.iban,this.check}) : super(key: key);
  String? iban;
  bool? check = false ;

  @override
  State<StatefulWidget> createState() => _ExampleHomePageState();
}

class _ExampleHomePageState extends State<ExampleHomePage> {
  UserController userController = Get.put(UserController());
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();

  bool isAuthenticated = false;
  var storedPasscode = '123456';
@override
  void initState() {
    // TODO: implement initState
    super.initState();
   

  }
  @override
  Widget build(BuildContext context) {
    return 
    
    Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
      onTap: () { 
        Nav.toScreen(context,HomePage() );
        
         },
      child: Icon(
        Icons.menu,color: Colors.black, 

      ),
  ),
  actions: [IconButton(onPressed: ()async{
   await  userController.SendMailss();
  }, icon:Icon(Icons.abc_sharp,color: Colors.black,))],
        title: Text("widget.title"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text('You are ${isAuthenticated ? '' : 'NOT'} authenticated'),
            _defaultLockScreenButton(context),
            // _customColorsLockScreenButton(context)
          ],
        ),
      ),
    );
  }
     

  

  _defaultLockScreenButton(BuildContext context) => 
  MaterialButton(
        color: Theme.of(context).primaryColor,
        child: Text('Write Password'),
        onPressed: () {
          _showLockScreen(
            context,
            opaque: false,
            cancelButton: Text(
              'Cancel',
              style: const TextStyle(fontSize: 16, color: Colors.white),
              semanticsLabel: 'Cancel',
            ),
          );
        },
      );



  _showLockScreen(
    BuildContext context, {
    required bool opaque,
    CircleUIConfig? circleUIConfig,
    KeyboardUIConfig? keyboardUIConfig,
    required Widget cancelButton,
    List<String>? digits,
  }) 
  {
    Navigator.push(
        context,
        PageRouteBuilder(
          opaque: opaque,
          pageBuilder: (context, animation, secondaryAnimation) =>
              PasscodeScreen(
            title: Text(
              'Write Passcode',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
            circleUIConfig: circleUIConfig,
            keyboardUIConfig: keyboardUIConfig,
            passwordEnteredCallback: widget.check == true ?_onPasscodeEnteredForCheck :  _onPasscodeEntered,
            cancelButton: cancelButton,
            deleteButton: Text(
              'Delete',
              style: const TextStyle(fontSize: 16, color: Colors.white),
              semanticsLabel: 'Delete',
            ),
            shouldTriggerVerification: _verificationNotifier.stream,
            backgroundColor: Colors.black.withOpacity(0.8),
            cancelCallback: _onPasscodeCancelled,
            digits: digits,
            passwordDigits: 6,
            bottomWidget: _buildPasscodeRestoreButton(),
          ),
        ));
  }
//   
  _onPasscodeEnteredForCheck(String enteredPasscode)async {
    await userController.checkPass( enteredPasscode);
               if(userController.checked == true) {
                Get.snackbar("Password Matched", "Successfull");
                widget.iban  == "iban"? await userController.accIbanCheck():
             await  userController.accSendMoneyCheck(widget.iban.toString()); 
                
               }
               else {
                 Get.snackbar("Password Dnt Match", "Write Correct Password");
               }

  }

  _onPasscodeEntered(String enteredPasscode)async {
          await userController.updatePasscode(enteredPasscode);
 
  }



  _onPasscodeCancelled() {
    Navigator.maybePop(context);
  }

  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }

  _buildPasscodeRestoreButton() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.only(bottom: 10.0, top: 20.0),
          child: TextButton(
            child: Text(
              "Reset passcode",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
            onPressed: _resetAppPassword,

          ),
        ),
      );

  _resetAppPassword() {
    Navigator.maybePop(context).then((result) {
      if (!result) {
        return;
      }
      _showRestoreDialog(() {
        Navigator.maybePop(context);
        //TODO: Clear your stored passcode here
      });
    });
  }

  _showRestoreDialog(VoidCallback onAccepted) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Reset passcode",
            style: const TextStyle(color: Colors.black87),
          ),
          content: Text(
            "Passcode reset is a non-secure operation!\n\nConsider removing all user data if this action performed.",
            style: const TextStyle(color: Colors.black87),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            TextButton(
              child: Text(
                "Cancel",
                style: const TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Navigator.maybePop(context);
              },
            ),
            TextButton(
              child: Text(
                "I understand",
                style: const TextStyle(fontSize: 18),
              ),
              onPressed: onAccepted,
            ),
          ],
        );
      },
    );
  }
}