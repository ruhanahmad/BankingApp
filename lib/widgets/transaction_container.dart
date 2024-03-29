import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/constants/datepicker.dart';
import 'package:bnacash/pages/add_money.dart';
import 'package:bnacash/pages/login/models/dob.dart';
import 'package:bnacash/pages/login/proof_of_residency.dart';
import 'package:bnacash/pages/second_screen.dart';
import 'package:bnacash/pages/whom_to_pay.dart';
import 'package:bnacash/widgets/calendarss.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'custom_button.dart';
import 'package:intl/intl.dart';
import 'package:bnacash/Controller/userController.dart';

class TransactionContainer extends StatefulWidget {
  const TransactionContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<TransactionContainer> createState() => _TransactionContainerState();
}

class _TransactionContainerState extends State<TransactionContainer> {
  String? _dropDownValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userController.getAccountData();
    userController.getNotification();
    userController.getIDo();
  }

  @override
  Widget build(BuildContext context) {
    DateTime _selectedDate = DateTime.now();
    UserController userController = Get.put(UserController());

    return GetBuilder<UserController>(

        // init: UserController(),

        builder: (builder) {
      return Container(
        padding: const EdgeInsets.all(15.0),
        height: 1000,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          // '0 TND',
                          builder.balances == null ? "0" : builder.balances,
                          // builder.accountsList[0].accountB,
                          // builder.accountsList.length > 0 ?
                          // builder.accountsList[0].accountB :"",
                          style: GoogleFonts.oxygen(
                            fontSize: 50,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text("TND"),
                        IconButton(
                            onPressed: () {
                              builder.getAccountData();
                              // builder.SendMailss();
                            },
                            icon: Icon(Icons.zoom_in))
                      ],
                    ),
                    const Text(
                      'Dinar',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                const Spacer(),
                InkWell(
                  onTap: () => Nav.toScreen(context, const Secondscreen()),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/images/tunisia.png",
                    ),
                    radius: 25,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                MyCustomButton(
                  label: 'Add Money',
                  width: 150,
                  height: 5,
                  icon: Icons.add,
                  pressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AddMoney()),
                    );
                  },
                ),
                MyCustomButton(
                  label: 'Send',
                  width: 90,
                  height: 5,
                  icon: Icons.arrow_forward,
                  pressed: () async {
                    await userController.contactListed();
                    Nav.toScreen(context, WhomToPay());
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blueGrey.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      fixedSize: const Size(60, 5),
                    ),
                    child: const Icon(
                      FontAwesomeIcons.ellipsisH,
                      size: 15,
                    ),
                    onPressed: () {
                      //login with any account
                      Get.to(ProofPage());
                      /*  Nav.toScreen(context, DatePicker(dateChangedCallback: (date){
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
  comment it 
   
  );*/
                    },
                  ),
                ),
              ],
            ),
             StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
        .collection("account")
        .doc(userController.userId!.uid)
        .collection("notifications")
        .orderBy('dateTime', descending: true)
        .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
           if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final docs = snapshot.data!.docs;
          return 
          Column(
                  children: [
                    Padding(
                    padding: EdgeInsets.symmetric(vertical: 25.0),
                    child: Text(
                      'Transactions',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                             ),
                                 Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 15.0),
              child: Column(
                children: [
                  Container(
                      height: 700,
                      width: Get.width,
                      child: ListView.builder(
                          itemCount:
                              docs.length >= 10
                                  ? 10
                                  : docs.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, i) {
                            final data = docs[i];
                            return data["type"] == "prepaidCode"
                                ? notificationField(
                                    text:
                                        "Money Added via ${data["username"].toString()}",

                                    icon: FaIcon(FontAwesomeIcons.gift),
                                    // "assets/images/prepaidcode.png",

                                    subtitle:
                                        "${formatTransactionDate(data["dateTime"].toDate())}",

                                    trailings:
                                        data["balance"].toString(),
                                  )
                                : data["type"] == "sending"
                                    ? notificationField(
                                        text:
                                            "To ${data["username"].toString()}",
                                        icon:
                                            FaIcon(FontAwesomeIcons.arrowRight),
                                        subtitle:
                                            "${formatTransactionDate(data["dateTime"].toDate())}",
                                        trailings:
                                            data["balance"].toString(),
                                      )
                                    : data["type"] == "receiving"
                                        ? notificationField(
                                            text:
                                                "From ${data["username"].toString()}",
                                            icon: FaIcon(
                                                FontAwesomeIcons.arrowLeft),
                                            subtitle:
                                                "${formatTransactionDate(data["dateTime"].toDate())}",
                                            trailings: data["balance"]
                                                .toString(),
                                          )
                                        : data["type"] == "CreditCard"
                                            ? notificationField(
                                                text:
                                                    "Money Added via ${data["username"].toString()}",
                                                icon: FaIcon(FontAwesomeIcons
                                                    .creditCard),
                                                subtitle:
                                                    "${formatTransactionDate(data["dateTime"].toDate())}",
                                                trailings: data["balance"]
                                                    .toString(),
                                              )
                                            : notificationField(
                                                text: data["username"]
                                                            .length !=
                                                        null
                                                    ? data["username"]
                                                        .toString()
                                                    : "hi how are you",
                                                icon: FaIcon(
                                                    FontAwesomeIcons.hand),
                                                subtitle:
                                                    "${formatTransactionDate(data["dateTime"].toDate())}",
                                                trailings: data["balance"]
                                                    .toString(),
                                              );
                          })),
                ],
              ),
              // child: Row(
              //   children: [
              //     FaIcon(
              //       FontAwesomeIcons.solidClock,
              //       size: 22,
              //       color: Colors.grey.withOpacity(0.3),
              //     ),
              //     const SizedBox(width: 8.0),
              //     Text(
              //       'No transactions yet',
              //       style: TextStyle(
              //           color: Colors.grey.withOpacity(0.3),
              //           fontSize: 18,
              //           fontWeight: FontWeight.w600),
              //     ),
              //   ],
              // ),
            ),
                  ],
                );
        },
      
             ),
        
          ],
        ),
      );
    });
  }

  formatTransactionDate(DateTime date) {
    final now = DateTime.now();

    // userController.update();
    if (now.day == date.day &&
        now.month == date.month &&
        now.year == date.year) {
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

  Widget notificationField(
      {String? text, icon, String? subtitle, String? trailings}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          child: ListTile(
            leading: icon,
            // CircleAvatar(
            //   radius: 25,
            //   backgroundImage: AssetImage(
            //     icon!,
            //   ),
            // ),

            //open that page
            trailing: Text(
              trailings == null ? " zero " : trailings,
              style: kContentTextStyle,
            ),
// i will make it you are asking aboyt that pop up menus ? yes
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
