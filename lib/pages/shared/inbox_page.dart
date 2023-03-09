import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'package:bnacash/Controller/userController.dart';
import 'package:bnacash/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({Key? key}) : super(key: key);

  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  final userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: kPrimaryColor,
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Inbox",
                style: kAppBarTextStyle.copyWith(fontSize: 25),
              ),
              const SizedBox(height: 20),
              const Text(
                "Yesterday",
                style: kContentTextStyle,
              ),

             
             SingleChildScrollView(
               child: Container(
                height: 1000,
                width: Get.width,
                child:
               
                 ListView.builder(
                  itemCount: userController.notificationList.length,
                  itemBuilder: (context,i){
             return   Column(
               children: [
                 Text("${formatTransactionDate(userController.dateTimess[i].toDate())}"),
                     // Text("${userController.dateTimess[i]}"),
                 // convertTimestamp( userController.dateTimess[i]),
                     // formatTransactionDate(userController.dateTimess[i]),
             
                     userController.type[i] == "prepaidCode" ?
                     notificationField(
                        text: "Money Added",
                 
                        icon: "assets/images/prepaidcode.png",
                 
                        subtitle:
                 
                          "You just added the amount of ${userController.bala[i].toString()} with a prepaid code"
                 
                            ):
                              userController.type[i] == "sending" ?
                            notificationField(
                 
                        text: "Money Sent",
                 
                        icon: "assets/images/send.png",
                 
                        subtitle:
                 
                           "You just sent the amount of ${userController.bala[i]} to ${userController.notificationList[i].toString()}"
                 
                            ):
                             userController.type[i] == "receiving" ?
                            notificationField(
                 
                        text: "Money Received",
                 
                        icon: "assets/images/send.png",
                 
                        subtitle:
                 
                          "You just received the amount of ${userController.bala[i]} from ${userController.notificationList[i]})"
                 
                            ): 
                             userController.type[i] == "CreditCard" ?
                            notificationField(
                 
                        text: "Money Added Through Credit Card",
                 
                        icon: "assets/images/debitcard.png",
                 
                        subtitle:
                 
                           "You just add the amount of ${userController.bala[i].toString()} with the debit card ending with ${userController.notificationList[i].toString()} )"
                 
                            ):
                     
                   
                      notificationField(
                 
                        text: userController.notificationList.length != null ? userController.notificationList[i].toString() :"hi how are you",
                 
                        icon: "assets/images/tunisia.png",
                 
                        subtitle:
                 
                           userController.bala[i].toString() + "amount received"
                 
                            ),
             
               ],
             );
                })
                
                ),
             ),
        
              
    
             SizedBox(height: 10),
             Text(
                "userController.notificationList[0].DateTime.toString()"
                ,
                style: kContentTextStyle,
              ),
              notificationField(
                  text: "Add money confidently",
                  icon: "assets/images/visa.png",
                  subtitle:
                      "Data security and spend protection are our priorities.\nLearn more"),
              const SizedBox(height: 10),
              const Text(
                "October 3",
                style: kContentTextStyle,
              ),
              notificationField(
                  text: "Keep your money with us.",
                  icon: "assets/images/contacts.png",
                  subtitle:
                      "Our customers trust us with their money. Learn more"),
              const SizedBox(height: 10),
              const Text(
                "October 1",
                style: kContentTextStyle,
              ),
              notificationField(
                  text: "Don't leave us hanging!",
                  icon: "assets/icons/icon.png",
                  subtitle:
                      "Add money to start exploring the revolutionary features we have to offer."),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
 DateTime ?  convertTimestamp(Timestamp timestamp) {
  if (timestamp != null) {
    return timestamp.toDate();
  } else {
    return null;
  }
}



    formatTransactionDate(DateTime date) {
  final now = DateTime.now();
  if (now.day == date.day && now.month == date.month && now.year == date.year) {
    // transaction done during the current day
    return DateFormat.jm().format(date); // format as "2:15 PM"
  } else if (now.difference(date).inDays < 7) {
    // transaction done during the current week
    return DateFormat.E().format(date); // format as "Tuesday"
  } else if (now.year == date.year) {
    // transaction date is more than a week ago, but less than a year ago
    return DateFormat('d MMM').format(date); // format as "15 Feb"
  } else {
    // transaction date is more than a year ago
    return DateFormat.y().format(date); // format as "2022"
  }
}


  Widget notificationField({String? text, String? icon, String? subtitle}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(
                icon!,
              ),
            ),
            title: Text(
              text!,
              style: kContentTextStyle,
            ),
            subtitle: Text(
              subtitle!,
              style: kContentTextStyle.copyWith(fontSize: 11),
            ),
          ),
        ),
      ),
    );
    
  }
  
}
