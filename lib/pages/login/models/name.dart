import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/models/primary_button.dart';
import 'package:bnacash/pages/login/models/dob.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/userController.dart';

class NameField extends StatefulWidget {
  const NameField({Key? key}) : super(key: key);

  @override
  _NameFieldState createState() => _NameFieldState();
}

class _NameFieldState extends State<NameField> {
    UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Full Name",
              style: kAppBarTextStyle.copyWith(fontSize: 25),
            ),
            const SizedBox(height: 10),
            const Text(
              "As stated on your official ID. We need your name to verify your identity.",
              style: kContentTextStyle,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.fromLTRB(15.0, 0.0, 10.0, 0.0),
                    filled: true,
                    fillColor: kPrimaryColor.withOpacity(0.3),
                    labelText: 'First Name',
                    labelStyle: kFormTextStyle,
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(color: kPrimaryColor),
                    )),
                keyboardType: TextInputType.text,
                obscureText: false,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter your First Name';
                  }
                  return null;
                },
                onChanged: (value) {
                userController.fullName =   value;
                },
              ),
            ),
            const SizedBox(height: 10),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
            //   child: TextFormField(
            //     decoration: InputDecoration(
            //         contentPadding:
            //             const EdgeInsets.fromLTRB(15.0, 0.0, 10.0, 0.0),
            //         filled: true,
            //         fillColor: kPrimaryColor.withOpacity(0.3),
            //         labelText: 'Last Name',
            //         labelStyle: kFormTextStyle,
            //         border: InputBorder.none,
            //         enabledBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(15.0),
            //           borderSide: const BorderSide(color: Colors.white),
            //         ),
            //         focusedBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(15.0),
            //           borderSide: const BorderSide(color: kPrimaryColor),
            //         )),
            //     keyboardType: TextInputType.text,
            //     obscureText: false,
            //     validator: (String? value) {
            //       if (value!.isEmpty) {
            //         return 'Please enter your Last Name';
            //       }
            //       return null;
            //     },
            //   ),
            // ),
            const SizedBox(height: 20),
            const Spacer(),
    
                 ElevatedButton
                  
                (
                  
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 8.0),
                                      elevation: 5.0,
                                      primary: kPrimaryColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0)),
                                    ),
                  onPressed: () async{
                     print(userController.fullName );
                     Get.to(DobField());
                    // await userController.uploadData();
                   }, child: Text("Next"))
          ],
        ),
      ),
    );
  }
}
