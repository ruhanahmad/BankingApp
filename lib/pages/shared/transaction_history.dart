import 'package:bnacash/constants/datepicker.dart';
import 'package:bnacash/pages/shared/datePickerTwo.dart';
import 'package:bnacash/pages/shared/nkloTwo.dart';
import 'package:bnacash/widgets/calendarss.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  void initState() {
      userController.getNotification();
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
      DateTime _selectedDate = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: kPrimaryColor,
        ),
        elevation: 0.0,
      ),
      body: 
      
      StreamBuilder<QuerySnapshot>(
         stream: FirebaseFirestore.instance
        .collection("account")
        .doc(userController.userId!.uid)
        .collection("notifications")
        .orderBy('dateTime', descending: true)
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
                "Transaction History",
                style: kAppBarTextStyle.copyWith(fontSize: 25),
              ),
                 Row(children: [
              GestureDetector(
                onTap: () {
                     Nav.toScreen(context, DatePicker(dateChangedCallback: (date){
           _selectedDate      =  date;
           var month = _selectedDate.month;
             var year = _selectedDate.year;
           print(year);
           setState(() {
             _selectedDate = date;
                 
           });
              userController.selectedDate = date;
                  userController.update();
                    
  }
  
  ,)
  
  );
                  // Nav.toScreen(context, nklo());
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
                                                      Nav.toScreen(context, DatePickerTwo(dateChangedCallback: (date){
           _selectedDate      =  date;
           var month = _selectedDate.month;
             var year = _selectedDate.year;
           print(year);
           setState(() {
             _selectedDate = date;
              
           });
                    userController.selectedDateYear = date;
                  userController.update();
                    
  }
  
  ,)
  
  );
                                    // Nav.toScreen(context,  nkloTwo());
                                  },
                                   child: Container(
                                                    
                                                     decoration: BoxDecoration(
                                                       color: Colors.blue,
                                                      
                                                     ),
                                                     child: Text("Export Yearly Transactions")),
                                 ),

                 ],),
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
                  final data = docs[i];
return   Column(
  children: [
    Text("${formatTransactionDate(data["dateTime"].toDate())}"),
        // Text("${userController.dateTimess[i]}"),
    // convertTimestamp( userController.dateTimess[i]),
        // formatTransactionDate(userController.dateTimess[i]),

        data["type"] == "prepaidCode" ?
        notificationField(
                      text: "Money Added via ${data["username"].toString()}",
    
                      icon: FaIcon(FontAwesomeIcons.gift),
    
                      subtitle:
    
                        "${formatTransactionDate(data["dateTime"].toDate())}",
                        trailings:data["balance"].toString(),
    
                          ):
                            data["type"] == "sending" ?
                          notificationField(
    
                      text: "Money sent To ${data["username"].toString()}",
    
                      icon: FaIcon(FontAwesomeIcons.arrowRight),
    
                      subtitle:
    
                         "${formatTransactionDate(data["dateTime"].toDate())}",
                         trailings:  data["balance"].toString(),
    
                          ):
                           data["type"] == "receiving" ?
                          notificationField(
    
                      text: "From ${data["username"].toString()}",
    
                      icon: FaIcon(FontAwesomeIcons.arrowLeft),
    
                      subtitle:
    
                       "${formatTransactionDate(data["dateTime"].toDate())}",

                        trailings:  data["balance"].toString(),
    
                          ): 
                           data["type"] == "CreditCard" ?
                          notificationField(
    
                      text: "Money Added via ${data["username"].toString()}",
    
                      icon: FaIcon(FontAwesomeIcons.creditCard),
    
                      subtitle:
    
                        "${formatTransactionDate(data["dateTime"].toDate())}",
                         trailings:  data["balance"].toString(),
    
                          ):
        
      
         notificationField(
    
                      text: data["username"] != null ? data["username"].toString() :"hi how are you",
    
                      icon: FaIcon(FontAwesomeIcons.hand),
    
                      subtitle:
    
                     "${formatTransactionDate(data["dateTime"].toDate())}",

                        trailings:  data["balance"].toString(),
    
                          ),

  ],
);
              })
              
              ),
        
              
    
          

             
              const SizedBox(height: 10),
            ],
          ),
        ),
      );


        }
        
        )

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
    return  DateFormat.jm().format(date); // format as "2:15 PM"
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


  Widget notificationField({String? text,  icon, String? subtitle,String? trailings}) {
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
            icon
            ,
            // CircleAvatar(
            //   radius: 25,
            //   backgroundImage: AssetImage(
            //     icon!,
            //   ),
            // ),
            trailing: Text(trailings == null ?" zero ":trailings,
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
