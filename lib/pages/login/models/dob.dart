import 'package:bnacash/Controller/userController.dart';
import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/models/primary_button.dart';
import 'package:bnacash/pages/login/models/email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DobField extends StatefulWidget {
  const DobField({Key? key}) : super(key: key);

  @override
  _DobFieldState createState() => _DobFieldState();
}
  UserController userController = Get.put(UserController());

class _DobFieldState extends State<DobField> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Date of Birth",
              style: kAppBarTextStyle.copyWith(fontSize: 25),
            ),
            const SizedBox(height: 10),
            const Text(
              "As stated on your official ID. You must atleast 18 years old to open an account",
              style: kContentTextStyle,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                onChanged: (value) {
                  userController.dob = value;
                },
                decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.fromLTRB(15.0, 0.0, 10.0, 0.0),
                    filled: true,
                    fillColor: kPrimaryColor.withOpacity(0.3),
                    labelText: 'DD/MM/YYYY',
                    labelStyle: kFormTextStyle,
                    border: InputBorder.none,
                    prefixIcon: const Icon(Icons.search_rounded),
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
                    return 'Please Enter your DOB';
                  }
                  return null;
                },
                
              ),
            ),
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
                     print(userController.dob );
                     Get.to(EmailField(),);
                    // await userController.uploadData();
                   }, child: Text("Next"))
          ],
        ),
      ),
    );
  }
}
