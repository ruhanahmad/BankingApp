import 'package:bnacash/pages/shared/nkloTwo.dart';
import 'package:bnacash/widgets/calendarss.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'package:bnacash/Controller/userController.dart';
import 'package:bnacash/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  _TransactionHistoryState createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Transaction History",
                    style: kAppBarTextStyle.copyWith(fontSize: 25),
                  ),
                 Row(children: [
                  GestureDetector(
                    onTap: () {
                      Nav.toScreen(context, nklo());
                    },
                    child: Container(
                     
                      decoration: BoxDecoration(
                        color: Colors.blue,
                       
                      ),
                      child: Text("Export monthly Transactions")),
                  ),

                    SizedBox(width: 20,),
                                     GestureDetector(
                                      onTap: () {
                                       
                                        Nav.toScreen(context,  nkloTwo());
                                      },
                                       child: Container(
                                                        
                                                         decoration: BoxDecoration(
                                                           color: Colors.blue,
                                                          
                                                         ),
                                                         child: Text("Export Yearly Transactions")),
                                     ),

                 ],)


                ],
              ),
              const SizedBox(height: 20),
              // const Text(
              //   "Yesterday",
              //   style: kContentTextStyle,
              // ),

             
             Container(
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
                      text: "Money Added via ${userController.notificationList[i].toString()}",
    
                      icon: "assets/images/prepaidcode.png",
    
                      subtitle:
    
                        "${formatTransactionDate(userController.dateTimess[i].toDate())}",
                        trailings:userController.bala[i].toString(),
    
                          ):
                            userController.type[i] == "sending" ?
                          notificationField(
    
                      text: "Money sent To ${userController.notificationList[i].toString()}",
    
                      icon: "assets/images/send.png",
    
                      subtitle:
    
                         "${formatTransactionDate(userController.dateTimess[i].toDate())}",
                         trailings:  userController.bala[i].toString(),
    
                          ):
                           userController.type[i] == "receiving" ?
                          notificationField(
    
                      text: "From ${userController.notificationList[i].toString()}",
    
                      icon: "assets/images/send.png",
    
                      subtitle:
    
                       "${formatTransactionDate(userController.dateTimess[i].toDate())}",

                        trailings:  userController.bala[i].toString(),
    
                          ): 
                           userController.type[i] == "CreditCard" ?
                          notificationField(
    
                      text: "Money Added via ${userController.notificationList[i].toString()}",
    
                      icon: "assets/images/debitcard.png",
    
                      subtitle:
    
                        "${formatTransactionDate(userController.dateTimess[i].toDate())}",
                         trailings:  userController.bala[i].toString(),
    
                          ):
        
      
         notificationField(
    
                      text: userController.notificationList.length != null ? userController.notificationList[i].toString() :"hi how are you",
    
                      icon: "assets/images/tunisia.png",
    
                      subtitle:
    
                     "${formatTransactionDate(userController.dateTimess[i].toDate())}",

                        trailings:  userController.bala[i].toString(),
    
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


  Widget notificationField({String? text, String? icon, String? subtitle,String? trailings}) {
    return 
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          child: 
          ListTile(

            leading: 
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(
                icon!,
              ),
            ),
            trailing: 
            Text(trailings == null ? " zero" : trailings,
              style: kContentTextStyle,),

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
