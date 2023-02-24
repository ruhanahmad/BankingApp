import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/models/primary_button.dart';
import 'package:bnacash/pages/login/models/name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/userController.dart';

class HomeAddress extends StatefulWidget {
  const HomeAddress({Key? key}) : super(key: key);

  @override
  _HomeAddressState createState() => _HomeAddressState();
}

class _HomeAddressState extends State<HomeAddress> {
    UserController userController = Get.put(UserController());
  bool isSearching = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Home Address",
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
                  decoration: InputDecoration(
                
                      contentPadding:
                          const EdgeInsets.fromLTRB(15.0, 0.0, 10.0, 0.0),
                      filled: true,
                      fillColor: kPrimaryColor.withOpacity(0.3),
                      labelText: 'Street',
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
                      return 'Please Enter an street';
                    }
                    return null;
                  },
                  onChanged: (address) {
                   
                      userController.street= address;
                      userController.update();
                   
                  },
                ),
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
                      labelText: 'City',
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
                      return 'Please Enter an City';
                    }
                    return null;
                  },
                  onChanged: (address) {
                   
                      userController.city= address;
                      userController.update();
                   
                  },
                ),
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
                      labelText: 'Region',
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
                      return 'Region';
                    }
                    return null;
                  },
                  onChanged: (address) {
                   
                      userController.region= address;
                      userController.update();
                   
                  },
                ),
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
                      labelText: 'Zip code',
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
                      return 'Zip Code';
                    }
                    return null;
                  },
                  onChanged: (address) {
                   
                      userController.zipcode= address;
                      userController.update();
                   
                  },
                ),
              ),
              // isSearching
              //     ? Container(
              //         padding: const EdgeInsets.all(8.0),
              //         width: double.maxFinite,
              //         decoration: BoxDecoration(
              //             color: kPrimaryColor.withOpacity(0.3),
              //             borderRadius: BorderRadius.circular(15)),
              //         child: Row(
              //             crossAxisAlignment: CrossAxisAlignment.center,
              //             children: [
              //               Opacity(
              //                 opacity: 0.75,
              //                 child: Image.asset(
              //                   "assets/icons/icon.png",
              //                   height: 40,
              //                   width: 40,
              //                 ),
              //               ),
              //               const SizedBox(
              //                 width: 10,
              //               ),
              //               const Text(
              //                 "Search results will appear here",
              //                 style: kContentTextStyle,
              //               ),
              //             ]),
              //       )
              //     : Container(),
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
               Get.to(NameField());
            }
        
 print(userController.address);
                    
           
                    
                    // await userController.uploadData();
                   }, child: Text("Next"))
            ],
          ),
        ),
      ),
    );
  }
}
