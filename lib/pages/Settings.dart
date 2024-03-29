import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/pages/account_detail.dart';
import 'package:bnacash/pages/bank_transfer.dart';
import 'package:bnacash/pages/constant.dart';
import 'package:bnacash/pages/hi.dart';
import 'package:bnacash/pages/login/models/dob.dart';
import 'package:bnacash/pages/sendContactMoney.dart';
import 'package:bnacash/widgets/custom_buttonn.dart';
import 'package:bnacash/widgets/cutom_heading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/userController.dart';

class Settingss extends StatefulWidget {


  @override
  State<Settingss> createState() => _SettingssState();
}

class _SettingssState extends State<Settingss> {
// @override
  @override
 final _formKey = GlobalKey<FormState>();


 Future<void>? alerts(){
    showDialog(context: context, builder: (context){
      return     AlertDialog(
        content: new
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: [
                Icon(Icons.camera),
                SizedBox(width: 5),
                Text('Change passcode '),
              ],
            ),
            SizedBox(height: 30,),
            TextFormField(
                    
                    onChanged: (value) {
             userController.reset = value;
                    },
                    decoration: InputDecoration(
               contentPadding:
                   const EdgeInsets.fromLTRB(15.0, 0.0, 10.0, 0.0),
               filled: true,
               fillColor: kPrimaryColor.withOpacity(0.3),
               labelText: 'Enter code you want to reset',
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
             if (value!.length < 6 || value.length > 6) {
               return 'Please Enter only  digits';
             }
             return null;
                    },
                  ),

                  GestureDetector(
                    onTap:   () async{

                      
                  await userController.resetPasscode(userController.reset!);
                    },
                    child: Container(
                      height: 30,
                      width: 50,
                      decoration: BoxDecoration(color: Colors.blue,),
                      child: Text("Submit"),),
                  )
          ],
        ),
      );
    });
  }




  
  Widget build(BuildContext context) {
    String dropdownValue = 'First Item'; // Initial value
     String? _dropDownValue;
     final userController = Get.put(UserController());
    return 
   Scaffold(
      backgroundColor: const Color(0xFFf3f4f6),
      body: SingleChildScrollView(
        child:
        
        GetBuilder<UserController>(
          init:UserController(),
          
          builder:(_){
          return        Container(
          padding: const EdgeInsets.only(
            left: 5,
            right: 10,
            top: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // action bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BackButton(color: Color(0xFF27282a)),

                ],
              ),

              // Main Heading
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: TopHeading(
                  heading: "Settings",
                ),
              ),
              // For buttons
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                 child: Container(
//                   height: 50,
//                   width: 300,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//             itemCount: userController.contactListThings!.length,
//               itemBuilder: (context, i){
                  
//                     return 
//  Container(
//  margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
//  child: ElevatedButton(
//    onPressed: () {
                    
//            print(userController.contactListThings![i]["name"]);
// var name =userController.contactListThings![i]["name"];
// var email = userController.contactListThings![i]["Email"];
// var iban = userController.contactListThings![i]["iban"];
//            userController.sendMoneyContactName = userController.contactListThings![i]["name"];
//            Get.to(SendMoneyContact(name: name,email:email,iban:iban));
//       //  Navigator.push(context,(MaterialPageRoute(builder: (context){
//       //   return SendMoneyContact(name: userController.contactListThings![i]["name"]);
//       //  })));
//    },
//    child: Text(
//      userController.contactListThings![i]["name"],
//      style: Constant.btnText,
//    ),
//    style: ElevatedButton.styleFrom(
//      onPrimary: const Color(0xFF335ebd),
//      primary: const Color(0xFFe8f1fa),
//      shape: RoundedRectangleBorder(
//        borderRadius: BorderRadius.circular(12),
//      ),
//    ),
//  ),
//     );
              
//               },
//           ),
//                 ),
//               ),
Column(
  children: [
        Container(
          height: 50,
          width: Get.width,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Text("Name",style: TextStyle(color: Colors.grey),),
          Text(userController.nameFor.toString() + " " + userController.lastNameFor.toString()),
          
              
            
            
            
            ],),
        ),
        SizedBox(height: 30,),

                Container(
          height: 50,
          width: Get.width,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Text("BIC",style: TextStyle(color: Colors.grey),),
          Text(userController.bicFor.toString()),
          
              
            
            
            
            ],),
        ),
          SizedBox(height: 30,),

                Container(
          height: 50,
          width: Get.width,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Text("IBAN",style: TextStyle(color: Colors.grey),),
          Text(userController.IbanFor.toString()),
          
              
            
            
            
            ],),
        ),
  ],
),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  child: Text(
                    "All",
                    style: TextStyle(
                      color: Color(0xFFb6b9c0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
  
                            Container(
                padding: const EdgeInsets.all(12.0),
                height: 85,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: 





                DropdownButton(
      hint: _dropDownValue == null
          ? Text(_.dropDownValue.toString())
          : Text(
              _dropDownValue.toString(),
              style: TextStyle(color: Colors.blue),
            ),
      isExpanded: true,
      iconSize: 30.0,
      style: TextStyle(color: Colors.blue),
      items: ['Premium', 'Topaz'].map(
        (val) {
          return DropdownMenuItem<String>(
            value: val,
            child: Text(val),
          );
        },
      ).toList(),
      onChanged: (val) {
           print(val);
     
            _.dropDownValue = val.toString();
            _.update();
        
      },
    ),


 
              ),
               ElevatedButton.icon(
                        onPressed: () async{
                        await  _.updatePackage();
                          // showModalBottomSheet(
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(12.0),
                          //     ),
                          //     context: context,
                          //     builder: (context) => sheet());
                        },
                        icon: const Icon(Icons.add),
                        label: const Text("Change Package"),
                        style: ElevatedButton.styleFrom(
                          onPrimary: const Color(0xFFffffff),
                          primary: const Color(0xFF095fd8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),

   SizedBox(height: 12,),

                           Container(
                padding: const EdgeInsets.all(12.0),
                height: 85,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: 
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Text("Change Passcode"),
               ElevatedButton.icon(
                        onPressed: () async{

                          await alerts();
                        // await  _.updatePackage();
                        // Get.to(ExampleHomePage());
                        
                          // showModalBottomSheet(
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(12.0),
                          //     ),
                          //     context: context,
                          //     builder: (context) => sheet());
                        },
                        icon: const Icon(Icons.add),
                        label: const Text("Change Passcode"),
                        style: ElevatedButton.styleFrom(
                          onPrimary: const Color(0xFFffffff),
                          primary: const Color(0xFF095fd8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),


                      

                ],)
    //             DropdownButton(
    //   hint: _dropDownValue == null
    //       ? Text(_.dropDownValue.toString())
    //       : Text(
    //           _dropDownValue,
    //           style: TextStyle(color: Colors.blue),
    //         ),
    //   isExpanded: true,
    //   iconSize: 30.0,
    //   style: TextStyle(color: Colors.blue),
    //   items: ['Premium', 'Topaz'].map(
    //     (val) {
    //       return DropdownMenuItem<String>(
    //         value: val,
    //         child: Text(val),
    //       );
    //     },
    //   ).toList(),
    //   onChanged: (val) {
    //        print(val);
     
    //         _.dropDownValue = val.toString();
    //         _.update();
        
    //   },
    // ),


 
              ),

  SizedBox(height: 30,),

                Container(
          height: 50,
          width: Get.width,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Text("Limit",style: TextStyle(color: Colors.grey),),
          Text(userController.limitFor.toString()),
          
              
            
            
            
            ],),
        ),
  SizedBox(height: 30,),
  GestureDetector(
    onTap: () async{
      await userController.logOut();
    },
    child: Center(
      child: Container(
        decoration: BoxDecoration(
              color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(12)),
    
        height: 40,
        width: 70,
        child: Center(child: Text("Logout")),),
    ),
  )
            ],
          ),
        );
        })
        
  
      ),
    );
   
  }
}



// For modal bottom sheet display screen
Widget sheet() => Column(children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: const Color(0xFFd9d7d7),
          ),
          height: 5,
          width: 50,
        ),
      ),
      const ListSheet(
        title: "Create Payment Method",
        subtitle: "Send money to anyone with a link",
        icons: Icon(
          Icons.link,
          color: Color(0xFF096df9),
          size: 18,
        ),
      ),
      const ListSheet(
        title: "Add a bank recipient",
        subtitle: "Transfer money to nay bank account",
        icons: Icon(
          Icons.account_balance,
          color: Color(0xFF096df9),
          size: 18,
        ),
      ),
      const ListSheet(
        title: "Invite a friend",
        subtitle: "Share a link to join Revolut",
        icons: Icon(
          Icons.favorite,
          color: Color(0xFF096df9),
          size: 18,
        ),
      ),
      const ListSheet(
        title: "Add a contact",
        subtitle: "Add a contact using phone or emial",
        icons: Icon(
          Icons.person,
          color: Color(0xFF096df9),
          size: 18,
        ),
      ),
    ]);

// for modal bottom sheet listTile
class ListSheet extends StatelessWidget {
  final String title;
  final String subtitle;
  final Icon icons;
  const ListSheet(
      {Key? key,
      required this.icons,
      required this.subtitle,
      required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFe4f0fe),
          child: icons,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Color(0xFF096df9),
            fontWeight: FontWeight.w700,
            fontSize: 17,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
              color: Color(0xFFb7b8ba),
              fontWeight: FontWeight.w500,
              fontSize: 15),
        ),
      ),
    );
  }
}
