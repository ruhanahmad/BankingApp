import 'package:bnacash/Controller/userController.dart';
import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/pages/reason_payment.dart';
import 'package:flutter/material.dart';
import 'package:bnacash/main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';


class SendMoneyContact extends StatelessWidget {
  String name;

  String email;
  String iban;
  SendMoneyContact({Key? key,required this.name,required this.email, required this.iban}) : super(key: key);


  @override
  Widget build(BuildContext context) {
   final userController =Get.put(UserController());
    final _formKey = GlobalKey<FormState>();
   
    return Scaffold(
      appBar: AppBar(title: Text(userController.sendMoneyContactName.toString()),backgroundColor: Colors.blue,),
      body:  
       
        
                 Form(
          key: _formKey,
        child: SafeArea(
          child: Padding(
            padding:  EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap:  (){
                    print("object");
                    userController.getContacts();
                  },
                  child: Text(
                    'Send Money',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:  [
                    // FaIcon(
                    //   FontAwesomeIcons.lock,
                    //   size: 20,
                    //   color: Colors.blue,
                    // ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      email.toString(),
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 20,),
                                        Text(
                                          // "asa",
                                          userController.balances == null ?"0":userController.balances,
                    //  builder.balances ==  null ? "0": builder.balances,

                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                                        Text(
                      '-->TND',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                  Text(
                      iban.toString(),
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
  

          
                          TextFormField(
                                 validator: (value) {
                  if (value == null  ) {
                   return "Value must not be null and range between 0 to ${userController.balances}";
                  }
                 
                  },
                  onChanged: (value) {
                    userController.beneIban = value;
                    userController.update();
                  },
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    hintText: 'Enter Balance',
                    hintStyle: const TextStyle(color: Colors.grey),
                    // suffix: IconButton(
                    //   icon: const FaIcon(
                    //     FontAwesomeIcons.camera,
                    //     color: Colors.blue,
                    //     size: 20,
                    //   ),
                    //   onPressed: () {},
                    // ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 8.0),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                                const SizedBox(
                  height: 30.0,
                ),
                Container(
                  color: Colors.white,
                  height: 40,width: Get.width,child: Column(
                    children: [
                    
                      Text("Sent from BNACASH"),
                    ],
                  ),),
                //               TextFormField(
                //                  validator: (value) {
                //   if (value == null && value!.length > 10 ) {
                //    return "Value must not be null and range between 0 to 10";
                //   }
                 
                //   },
                //   onChanged: (value) {
                //     userController.codeEntered = value;
                //     userController.update();
                //   },
                //   textAlign: TextAlign.left,
                //   decoration: InputDecoration(
                //     hintText: 'Sent from BNACASH',
                //     hintStyle: const TextStyle(color: Colors.grey),
                    
                //     suffix: IconButton(
                //       icon: const FaIcon(
                //         FontAwesomeIcons.camera,
                //         color: Colors.blue,
                //         size: 20,
                //       ),
                //       onPressed: () {},
                //     ),
                //     contentPadding: const EdgeInsets.symmetric(
                //         vertical: 5.0, horizontal: 8.0),
                //     filled: true,
                //     fillColor: Colors.white,
                //   ),
                // ),
                //            TextFormField(
                //                            validator: (value) {
                //   if (value == null && value!.length > userController.balances ) {
                //    return "Value must not be null and range between 0 to 1000";
                //   }
                 
                //   },
                //   onChanged: (value) {
                //     userController.prepaidBalance = value;
                //     userController.update();
                //   },
                //   textAlign: TextAlign.left,
                //   decoration: InputDecoration(
                //     hintText: 'Enter Balance',
                //     hintStyle: const TextStyle(color: Colors.grey),
                //     // suffix: IconButton(
                //     //   icon: const FaIcon(
                //     //     FontAwesomeIcons.camera,
                //     //     color: Colors.blue,
                //     //     size: 20,
                //     //   ),
                //     //   onPressed: () {},
                //     // ),
                //     contentPadding: const EdgeInsets.symmetric(
                //         vertical: 5.0, horizontal: 8.0),
                //     filled: true,
                //     fillColor: Colors.white,
                //   ),
                // ),
                // Spacer(),
                //    TextFormField(
                //               onChanged: (value) {
                //           userController.exB = value;
                //           userController.update();
                //           },
                //  validator: (value) {
                //   if (value == null && value!.length > userController.balances ) {
                //    return "Value must not be null and range between 0 to 1000";
                //   }
                 
                //   },
                    
                //     textAlign: TextAlign.left,
                //     decoration: InputDecoration(
                //       hintText: 'Add Amount',
                //       hintStyle: const TextStyle(color: Colors.grey),
                //       suffix: IconButton(
                //         icon: const FaIcon(
                //           FontAwesomeIcons.camera,
                //           color: Colors.blue,
                //           size: 20,
                //         ),
                //         onPressed: () {},
                //       ),
                //       contentPadding: const EdgeInsets.symmetric(
                //           vertical: 5.0, horizontal: 8.0),
                //       filled: true,
                //       fillColor: Colors.white,
                //     ),
                //   ),
                       
                // Row(
                //   children:  [
                //     Expanded(
                //       child: TextField(
                //         keyboardType: TextInputType.datetime,
                //         textAlign: TextAlign.left,
                //         decoration: InputDecoration(
                //           hintText: 'Expiration date',
                //           hintStyle: TextStyle(color: Colors.grey),
                //           contentPadding: EdgeInsets.symmetric(
                //               vertical: 20.0, horizontal: 8.0),
                //           filled: true,
                //           fillColor: Colors.white,
                //         ),
                //       ),
                //     ),
                //     SizedBox(
                //       width: 25.0,
                //     ),
                //     Expanded(
                //       child: TextField(
                //         textAlign: TextAlign.left,
                //         decoration: InputDecoration(
                //           hintText: 'CVV',
                //           hintStyle: TextStyle(color: Colors.grey),
                //           contentPadding: EdgeInsets.symmetric(
                //               vertical: 20.0, horizontal: 8.0),
                //           filled: true,
                //           fillColor: Colors.white,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                const Spacer(),
                   TextButton(
              style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
            fixedSize: Size(900, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            )
              ),
              child: Text(
          "Confirm",
          style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold
          ),
              ),
              onPressed: (){
           if (_formKey.currentState!.validate()){
                   print("object");
                    // userController.prepaid();
                    // Nav.toScreen(context, const ReasonPayment());
          
           }
           
            // userController.getAccountData();
              },
            ),
                // const MyRegularButton(
                //   label: 'Confirm',
                //   width: 400,
                //   height: 50,
                //   color: Colors.blue,
                //   labelColor: Colors.white,
                
                // ),
                // const SizedBox(
                //   height: 10.0,
                // ),
              ],
            ),
          ),
        ),
      )
       
      
    );
  }
}