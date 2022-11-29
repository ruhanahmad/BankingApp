import 'package:bnacash/Controller/userController.dart';
import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/models/primary_button.dart';
import 'package:bnacash/pages/login/find_friends.dart';
import 'package:bnacash/pages/login/models/occupation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailField extends StatefulWidget {
  const EmailField({Key? key}) : super(key: key);

  @override
  _EmailFieldState createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  bool acceptOffers = false;
  UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Email Address",
                style: kAppBarTextStyle.copyWith(fontSize: 25),
              ),
              const SizedBox(height: 10),
              const Text(
                "By law, we need your home address to open your account",
                style: kContentTextStyle,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  onChanged: (value) {
                    userController.email = value;
                  },
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.fromLTRB(15.0, 0.0, 10.0, 0.0),
                      filled: true,
                      fillColor: kPrimaryColor.withOpacity(0.3),
                      labelText: 'Email',
                      labelStyle: kFormTextStyle,
                      border: InputBorder.none,
                      // prefixIcon: const Icon(Icons.search_rounded),
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
                      return 'Please Enter a valid Email';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              // Row(
              //   children: [
              //     Checkbox(
              //       value: acceptOffers,
              //       onChanged: (bool? value) {
              //         setState(() {
              //           acceptOffers = value!;
              //         });
              //       },
              //     ),
              //     const SizedBox(
              //       width: 5,
              //     ),
              //     const Text(
              //       "Keep me up to date about BNA \noffers, products and services.",
              //       style: kContentTextStyle,
              //     ),
              //   ],
              // ),
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
                       print(userController.email );
                       Get.to(OccupationField());
                      // await userController.uploadData();
                     }, child: Text("Next"))
            ],
          ),
        ),
      ),
    );
  }
}
