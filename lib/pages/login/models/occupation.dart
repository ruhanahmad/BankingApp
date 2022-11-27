import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/models/primary_button.dart';
import 'package:bnacash/pages/hi.dart';
import 'package:bnacash/pages/login/models/dob.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OccupationField extends StatefulWidget {
  const OccupationField({Key? key}) : super(key: key);

  @override
  _OccupationFieldState createState() => _OccupationFieldState();
}

class _OccupationFieldState extends State<OccupationField> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Occupation",
              style: kAppBarTextStyle.copyWith(fontSize: 25),
            ),
            const SizedBox(height: 10),
            const Text(
              "Be as specific as possible about your work. For example, you might be a mobile app developer.",
              style: kContentTextStyle,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                onChanged: (value) {
                  userController.occupation = value;
                },
                decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.fromLTRB(15.0, 0.0, 10.0, 0.0),
                    filled: true,
                    fillColor: kPrimaryColor.withOpacity(0.3),
                    labelText: 'Occupation',
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
                    return 'Please enter an Occupation';
                  }
                  return null;
                },
              ),
            ),
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
                     print(userController.occupation);
                   
                    await userController.uploadData();
                      Get.to(ExampleHomePage());
                   }, child: Text("Next"))
          ],
        ),
      ),
    );
  }
}
