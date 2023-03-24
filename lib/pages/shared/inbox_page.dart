import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      // appBar: AppBar(
      //   leading: const BackButton(
      //     color: kPrimaryColor,
      //   ),
      //   elevation: 0.0,
      // ),
      body: 
      StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
        .collection("account").doc(userController.userId!.uid).collection("notifications").orderBy('dateTime', descending: true)
        .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
  if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final docs = snapshot.data!.docs;
          return 
             SingleChildScrollView(
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
        
             
             Container(
              height: 1000,
              width: Get.width,
              child:
             
               ListView.builder(
                itemCount: docs.length,
                itemBuilder: (context,i){
                  final data = docs[i];
             return   Column(
             children: [
               Text("${formatTransactionDate(data["dateTime"].toDate())}"),
                   // Text("${userController.dateTimess[i]}"),
               // convertTimestamp( userController.dateTimess[i]),
                   // formatTransactionDate(userController.dateTimess[i]),
             
                   data["type"] == "prepaidCode" ?
                   notificationField(
                      text: "Money Added",
               
                      icon:     FaIcon(FontAwesomeIcons.gift),
               
                      subtitle:
               
                        "You just added the amount of ${data["balance"].toString()} with a prepaid code"
               
                          ):
                            data["type"] == "sending" ?
                          notificationField(
               
                      text: "Money Sent",
               
                      icon:FaIcon(FontAwesomeIcons.arrowRight),
                      // "assets/images/send.png",
               
                      subtitle:
               
                         "You just sent the amount of ${data["balance"]} to ${data["username"].toString()}"
               
                          ):
                           data["type"] == "receiving" ?
                          notificationField(
               
                      text: "Money Received",
               
                      icon: FaIcon(FontAwesomeIcons.arrowLeft),
                      //"assets/images/send.png",
               
                      subtitle:
               
                        "You just received the amount of ${data["balance"]} from ${data["username"]})"
               
                          ): 
                           data["type"] == "CreditCard" ?
                          notificationField(
               
                      text: "Money Added Through Credit Card",
               
                      icon: FaIcon(FontAwesomeIcons.creditCard),
                      //"assets/images/debitcard.png",
               
                      subtitle:
               
                         "You just add the amount of ${data["balance"]} with the debit card ending with ${data["username"]} )"
               
                          ):
                   
                 
                    notificationField(
               
                      text: docs.length != null ? data["username"].toString() :"hi how are you",
               
                      icon: FaIcon(FontAwesomeIcons.hand),
                      //"assets/images/tunisia.png",
               
                      subtitle:
               
                         data["balance"].toString() + "amount received"
               
                          ),
             
             ],
             );
              })
              
              ),
        
              
          
             SizedBox(height: 10),
             Text(
                "userController.notificationList[0].DateTime.toString()"
                ,
                style: kContentTextStyle,
              ),
              // notificationField(
              //     text: "Add money confidently",
              //     icon: "assets/images/visa.png",
              //     subtitle:
              //         "Data security and spend protection are our priorities.\nLearn more"),
              // const SizedBox(height: 10),
              // const Text(
              //   "October 3",
              //   style: kContentTextStyle,
              // ),
              // notificationField(
              //     text: "Keep your money with us.",
              //     icon: "assets/images/contacts.png",
              //     subtitle:
              //         "Our customers trust us with their money. Learn more"),
              // const SizedBox(height: 10),
              // const Text(
              //   "October 1",
              //   style: kContentTextStyle,
              // ),
              // notificationField(
              //     text: "Don't leave us hanging!",
              //     icon: "assets/icons/icon.png",
              //     subtitle:
              //         "Add money to start exploring the revolutionary features we have to offer."),
              const SizedBox(height: 10),
            ],
          ),
        ),
      );

        })
   
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


  Widget notificationField({String? text,  icon, String? subtitle}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          child: ListTile(
            leading: 
            icon,
            // CircleAvatar(
            //   radius: 25,
              
            //   backgroundImage:
            //    AssetImage(
            //     icon!,
            //   ),
            // ),
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
