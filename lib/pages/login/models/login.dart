import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/models/primary_button.dart';
import 'package:bnacash/pages/login/models/dob.dart';
import 'package:bnacash/pages/login/models/phone_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controller/controller.dart';

class loginFeild extends StatelessWidget {
  loginFeild({Key? key }) : super(key: key);
  // final VoidCallback moveToNext;

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    
    return 
    
    Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Login to BNA Cash",
                style: kAppBarTextStyle.copyWith(fontSize: 25),
              ),
              const SizedBox(height: 10),
              const Text(
                "Enter your phone number to sign up",
                style: kContentTextStyle,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: kPrimaryColor.withOpacity(0.3)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage("assets/images/tunisia.png"))),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.0),
                            child: Text(
                              "+216",
                              style: kContentTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: 
                      TextFormField(
                        
                        onChanged: (value) {
                           phoneAuth.phoneNumbers = value;
                        phoneAuth.update();
                        },
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(15.0, 0.0, 10.0, 0.0),
                            filled: true,
                            fillColor: kPrimaryColor.withOpacity(0.3),
                            labelText: 'Enter Phone number',
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
                        keyboardType: TextInputType.number,
                        obscureText: false,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please Enter a Valid Phone Number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ],
              ),

                         GestureDetector(
              onTap: (){
                Get.to(PhoneField());
              } ,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Need to SignUp?"),
              ),
            ),
              const SizedBox(height: 20),
              const Spacer(),
              PrimaryButton(
                text: "Send Code",
                onPressed: () async{
                userController.signUps =  false;

                userController.update();
                await  userController.checksIFLogin( );
              // await  
              // phoneAuth.verifyPhone();
              // widget.moveToNext();
          
          
                  // phoneAuth!.wait.value
                  //     ? null
                  //     : () async {
                  //
                  //   authController!.start.value = 30;
                  //   authController!.wait.value = true;
                  //   authController!.buttonName.value = "Resend";
                  //   authController!.update();
                  //
                  //   await authController!.verifyPhoneNumber(
                  //       authController!.countryCode + authController!.phoneController!.text, context);
                  //   print("countryCode:"+authController!.countryCode.value);
                  // };
          
          
          
          
                },
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

PhoneAuth phoneAuth = Get.put(PhoneAuth());


