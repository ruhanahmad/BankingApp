import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/pages/login/models/address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import  'package:bnacash/Controller/userController.dart';

import '../../../models/primary_button.dart';
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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return


      Scaffold(
        body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Form(
          key: _formKey,
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
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
                //             ElevatedButton
                  
                // (
                  
                //                     style: ElevatedButton.styleFrom(
                //                       padding: const EdgeInsets.symmetric(
                //                           vertical: 10.0, horizontal: 8.0),
                //                       elevation: 5.0,
                //                       primary: kPrimaryColor,
                //                       shape: RoundedRectangleBorder(
                //                           borderRadius:
                //                               BorderRadius.circular(50.0)),
                //                     ),
                //   onPressed: () async{
                //      print(userController.address);
                //     //  Get.to(NameField());
                //     // await userController.uploadData();
                //    }, child: Text("Next")),
          //               PrimaryButton(
          //             text: "Confirm",
          //             onPressed: () async {
          //             // phoneAuth.verifyPhone();
          // //                    try {
          // //                PhoneAuthCredential credential = await PhoneAuthProvider.credential(verificationId: phoneAuth.verify, smsCode:_pinPutController.text);
            
          // //     // Sign the user in (or link) with the credential
          // //     await auth.signInWithCredential(credential);
          // //          userController.signUps == true?  
          // //  Get.to(CountryField())  :Get.to(HomePage()) ;
          // //     // await userController.checksIF();
             
          // //               } catch (e) {
          // //                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
              
          // //               }
                
          //               // Navigator.push(
          //               //     context,
          //               //     PageRouteBuilder(
          //               //         transitionDuration: const Duration(milliseconds: 1000),
          //               //         transitionsBuilder: (BuildContext context,
          //               //             Animation<double> animation,
          //               //             Animation<double> secondaryAnimation,
          //               //             Widget child) {
          //               //           animation = CurvedAnimation(
          //               //               parent: animation, curve: Curves.elasticInOut);
          //               //           return ScaleTransition(
          //               //             alignment: Alignment.center,
          //               //             scale: animation,
          //               //             child: child,
          //               //           );
          //               //         },
          //               //         pageBuilder: (BuildContext context,
          //               //             Animation<double> animation,
          //               //             Animation<double> secondaryAnimation) {
          //               //           return const PersonalInfo();
          //               //         }));
          //             },
          //           ),
                 
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
                          if (_formKey.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
            //     ScaffoldMessenger.of(context).showSnackBar(
            // const SnackBar(content: Text('Processing Data')),
            
            //     );
                 Get.to(HomeAddress());
              }
                       print(userController.dob );
                       
                      // await userController.uploadData();
                     }, child: Text("Next"))
                //   ElevatedButton
                  
                // (
                  
                //                     style: ElevatedButton.styleFrom(
                //                       padding: const EdgeInsets.symmetric(
                //                           vertical: 10.0, horizontal: 8.0),
                //                       elevation: 5.0,
                //                       primary: kPrimaryColor,
                //                       shape: RoundedRectangleBorder(
                //                           borderRadius:
                //                               BorderRadius.circular(50.0)),
                //                     ),
                //   onPressed: () async{
                //      print(userController.country);
                //      Get.to(HomeAddress());
                //     // await userController.uploadData();
                //    }, child: Text("Next"))
            ],
          ),
        ),
          ),
      );
  }
}
