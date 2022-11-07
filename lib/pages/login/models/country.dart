import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/pages/login/models/address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import  'package:bnacash/Controller/userController.dart';
class CountryField extends StatefulWidget {
  const CountryField({Key? key}) : super(key: key);

  @override
  _CountryFieldState createState() => _CountryFieldState();
}


class _CountryFieldState extends State<CountryField>
{
  UserController userController = Get.put(UserController());
  List<String> countries = [
    "France",
    "Morocco",
    "Tunisia",
  ];

  String country = "Tunisia";

  @override
  Widget build(BuildContext context) {
    return


      Scaffold(
        body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Country of Residence",
              style: kAppBarTextStyle.copyWith(fontSize: 25),
            ),
            const SizedBox(height: 10),
            const Text(
              "The terms and services which apply to yo will depend on you country of residence",
              style: kContentTextStyle,
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(15)),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text(
                  "Country",
                  style: kContentTextStyle,
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration.collapsed(
                      filled: false,
                      hintText: 'Country',
                      hintStyle: TextStyle(fontWeight: FontWeight.w600)),
                  value: country,
                  elevation: 16,
                  iconSize: 25.0,
                  icon: const Icon(Icons.arrow_drop_down_outlined),
                  style: const TextStyle(color: kPrimaryColor),
                  onChanged: (newValue) {
                  
                      userController.country = newValue!;
                      userController.update();
                   
                  },
                  validator: (value) {
                    if (value == null) {
                      return "Select Country";
                    }
                    return null;
                  },
                  items: countries.map<DropdownMenuItem<String>>((String opt) {
                    return DropdownMenuItem<String>(
                      value: opt,
                      child: Text(opt),
                    );
                  }).toList(),
                ),
             
              ]),
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
                   print(userController.country);
                   Get.to(HomeAddress());
                  // await userController.uploadData();
                 }, child: Text("Next"))
          ],
        ),
          ),
      );
  }
}
