import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/pages/account_detail.dart';
import 'package:bnacash/pages/bank_transfer.dart';
import 'package:bnacash/pages/constant.dart';
import 'package:bnacash/pages/sendContactMoney.dart';
import 'package:bnacash/widgets/custom_buttonn.dart';
import 'package:bnacash/widgets/cutom_heading.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../Controller/userController.dart';

class WhomToPay extends StatelessWidget {


// @override

  @override
  
  Widget build(BuildContext context) {
     final userController = Get.put(UserController());
    return 
   Scaffold(
      backgroundColor: const Color(0xFFf3f4f6),
      body: SingleChildScrollView(
        child: Container(
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
                  GestureDetector(
                    onTap:  (){
                      
                    },
                    child: const BackButton(color: Color(0xFF27282a))),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          userController.contactListed();
                        },
                        
                        child: const Icon(Icons.search, color: Color(0xFF27282a))),
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(Icons.person, color: Color(0xFF27282a)),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          Nav.toScreen(context, const AccountDetail());
                          // showModalBottomSheet(
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(12.0),
                          //     ),
                          //     context: context,
                          //     builder: (context) => sheet());
                        },
                        icon: const Icon(Icons.add),
                        label: const Text("New"),
                        style: ElevatedButton.styleFrom(
                          onPrimary: const Color(0xFFffffff),
                          primary: const Color(0xFF095fd8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // Main Heading
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: TopHeading(
                  heading: "Whom to Pay",
                ),
              ),
              // For buttons
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Container(
                  height: 50,
                  width: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
            itemCount: userController.contactListThings!.length,
              itemBuilder: (context, i){
                  
                    return 
 Container(
 margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
 child: ElevatedButton(
   onPressed: () {
                    
           print(userController.contactListThings![i]["name"]);
var name =userController.contactListThings![i]["name"];
var email = userController.contactListThings![i]["Email"];
var iban = userController.contactListThings![i]["iban"];
           userController.sendMoneyContactName = userController.contactListThings![i]["name"];
           userController.update();
           Get.to(SendMoneyContact(name: name,email:email,iban:iban));
      //  Navigator.push(context,(MaterialPageRoute(builder: (context){
      //   return SendMoneyContact(name: userController.contactListThings![i]["name"]);
      //  })));
   },
   child: Text(
     userController.contactListThings![i]["name"],
     style: Constant.btnText,
   ),
   style: ElevatedButton.styleFrom(
     onPrimary: const Color(0xFF335ebd),
     primary: const Color(0xFFe8f1fa),
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(12),
     ),
   ),
 ),
    );
              
              },
          ),
                ),
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
              // for making contact listTile
              // Container(
              //     padding: const EdgeInsets.symmetric(vertical: 10),
              //     decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.circular(12.0)),
              //     child: const ListTile(
              //       leading: Icon(Icons.person),
              //       title: Text(
              //         "Your contact list is empty. Contacts will appear when you add them.",
              //         style: TextStyle(
              //             color: Color(0xFF83888c),
              //             fontWeight: FontWeight.w500),
              //       ),
              //     )),
                            Container(
                padding: const EdgeInsets.all(12.0),
                height: 85,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    FloatingActionButton(
                      backgroundColor: Colors.blueGrey.withOpacity(0.2),
                      child: const FaIcon(
                        FontAwesomeIcons.buildingColumns,
                        color: Colors.blue,
                      ),
                      elevation: 0,
                      onPressed: () {},
                    ),
                           const SizedBox(
                      width: 12.0,
                    ),
                
              
                
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Bank Transfer',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          'Send Money',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    TextButton(
                      child:  Text(
                        'Change',
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blueGrey.withOpacity(0.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          fixedSize: const Size(80, 5)),
                      onPressed: () {
                        // Nav.toScreen(context, const MyCard());
                        Nav.toScreen(context, const BankCard());
                
                
                        
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
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
