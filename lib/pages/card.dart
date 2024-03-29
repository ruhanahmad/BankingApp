import 'package:bnacash/Controller/userController.dart';
import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/pages/login/models/dob.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bnacash/widgets/regular_button.dart';
import 'package:get/get.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
     final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Container(
                  height: Get.height + 5,
                  width: Get.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  
                      Text(
                        'Card in your name',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: kTitleSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // const SizedBox(
                      //   height: 5.0,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: const [
                      //     FaIcon(
                      //       FontAwesomeIcons.lock,
                      //       size: 20,
                      //       color: Colors.blue,
                      //     ),
                      //     SizedBox(
                      //       width: 15.0,
                      //     ),
                      //     Text(
                      //       'Processed securely by PCI DSS',
                      //       style: TextStyle(
                      //         color: Colors.blue,
                      //         fontSize: 16,
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      TextFormField(
                           keyboardType: TextInputType.number,
                        
                                  onChanged: (value) {
                              userController.cardsNum = value;
                              userController.update();
                              },
                     validator: (value) {
                      if (value!.length < 16  || value!.length > 16) {
                       return "Debit card number must contain 16 numbers";
                      }
                     
                      },
                        
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          hintText: 'Debit or credit card number',
                          hintStyle: const TextStyle(color: Colors.grey),
                          suffix: IconButton(
                            icon: const FaIcon(
                              FontAwesomeIcons.camera,
                              color: Colors.blue,
                              size: 20,
                            ),
                            onPressed: () {},
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 8.0),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        children:  [
                          Expanded(
                            child: 
                            TextFormField(
                          onChanged: (value) {
                              userController.Date = value;
                              userController.update();
                              },
                                                            validator: (value) {
                      if (value!.length < 5 || value!.length >5 ) {
                       return "Expiration Date must contain 5 values including /";
                      }
                      
                      },
                              keyboardType: TextInputType.datetime,
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                hintText: 'Expiration date',
                                hintStyle: TextStyle(color: Colors.grey),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 8.0),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 25.0,
                          ),
                          Expanded(
                            child: 
                            TextFormField(
                              onChanged: (value) {
                              userController.Cvv = value;
                              userController.update();
                              },
                                             validator: (value) {
                      if (value!.length < 3 || value!.length >3 ) {
                       return "Cvv must contain three numbers";
                      }
                      
                      },
                         keyboardType: TextInputType.number,
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                hintText: 'CVV',
                                hintStyle: TextStyle(color: Colors.grey),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 8.0),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                                                 TextFormField(
                                       validator: (value) {
                        if (value == null  ) {
                         return "Value must not be null and range between 0 to ${userController.balances}";
                        }
                       
                        },
                        onChanged: (value) {
                          userController.prepaidBalance = value;
                          userController.update();
                        },
                           keyboardType: TextInputType.number,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          hintText: 'Enter Balance',
                          hintStyle: const TextStyle(color: Colors.grey),
                          suffix: IconButton(
                            icon: const FaIcon(
                              FontAwesomeIcons.camera,
                              color: Colors.blue,
                              size: 20,
                            ),
                            onPressed: () {},
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 8.0),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                                   
                  
                  
                           
                  
                  
                  
                  
                  
                      SizedBox(height: 10,),
                          TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          fixedSize: Size(700, 50),
                          shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                          )
                      ),
                      child: Text(
                        "Add Card",
                        style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                        ),
                      ),
                      onPressed: (){
                          print("object");
                      
                        if (_formKey.currentState!.validate()) {
                            userController.getExCard();
                 
                      print("object");
                      
                    }
                  },
                    
                    ),
                      // const MyRegularButton(
                      //   label: 'Confirm',
                      //   width: 400,
                      //   height: 50,
                      //   color: Colors.blue,
                      //   labelColor: Colors.white,
                      // ),
                      const SizedBox(
                        height: 10.0,
                      ),
                  
                  
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
