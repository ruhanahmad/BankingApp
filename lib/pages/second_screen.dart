
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bnacash/Respnsive/respnsive.dart';
import 'package:bnacash/widgets/widgets.dart';
import 'package:bnacash/Controller/userController.dart';
import 'package:get/get.dart';
class Secondscreen extends StatefulWidget {
  const Secondscreen({Key? key}) : super(key: key);

  @override
  State<Secondscreen> createState() => _SecondscreenState();
}

class _SecondscreenState extends State<Secondscreen> {
  UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {

 return   GetBuilder<UserController>(builder: (builder){
    return DefaultTabController(
      //  length  of Tab bar

      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          actions: [
           IconButton(onPressed: (){
            userController.jnab();
           }, icon: Icon(Icons.r_mobiledata)) 
          ],
          leading: BackButton(
            color: Colors.black,
          ),
          backgroundColor: Colors.grey.shade200,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children:  [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                        builder.accountsList.length > 0 ?
                        builder.accountsList[0].accountB + " TND":"",
                    // '0 TND',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.security,
                    size: 20,
                    color: Colors.blue,
                  ),
                  Spacer(),
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/images/tunisia.png",
                    ),
                    radius: 25,
                  ),
                ],
              ),
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Dinars.',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  ' Active',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                // This  widget created to  1- add Icon of Button   2- name of Button  we did this  to be a clean code you can find it in side *widget file*
                ButtonWidget(
                  icon: Icons.loop_sharp,
                  nameButton: 'Exchange',
                ),
                ButtonWidget(
                  icon: Icons.receipt,
                  nameButton: 'Statement',
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 35,
              width: displayWidth(context) * .96,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                // / that is the containt of  Tab bar
                child: TabBar(
                    // here is the Tab bar  you acn add item as you wish and contror in  Shap of the *lable of the Tab bar *

                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.black,
                    indicator: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    tabs: const [
                      Text(
                        'LOCAL',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'jannah',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'SWIFT',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'jannah',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
              ),
            ),
            Row(
              children: const [
                Text(
                  'For cross-border transfers only',
                  style: TextStyle(
                      // height: 1.4,
                      fontSize: 12,
                      fontFamily: 'jannah',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                Spacer(),
                Text(
                  'Share',
                  style: TextStyle(
                      // height: 1.4,
                      fontSize: 15,
                      fontFamily: 'jannah',
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ],
            ),
            SizedBox(
              height: 500,
              //  that is  the  first containt of Widet
              child: TabBarView(
                children: [
                  // ***this is first tab  of tab bar *****
                  Card(
                    elevation: 8,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: SizedBox(
                      width: 340,
                      height: 435,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          // This  widget created to  1- add Icon to text   2- to add text    we did this  to be a clean code you can find it in side *widget file*
                          TextWidget(
                            icon: Icon(
                              Icons.security,
                              size: 20,
                              color: Colors.black,
                            ),
                            text:
                                'Your money is held and proctected by global banks.',
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 210),
                            child: Text(
                              'Read more.',
                              style: TextStyle(
                                  // height: 1.4,
                                  fontSize: 12,
                                  fontFamily: 'jannah',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                          ),
                          TextWidget(
                            icon: Image.asset('assets/lamp.png'),
                            text:
                                'Use these details to receive your salary and transfers from a bank account.',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextWidget(
                            icon: Icon(
                              Icons.gavel_sharp,
                              size: 20,
                              color: Colors.black,
                            ),
                            text:
                                'Give these details to merchants to set up Direct Debitsand automatically pay off your recurring bills. ',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextWidget(
                            icon: Icon(
                              Icons.watch_later_rounded,
                              size: 20,
                              color: Colors.black,
                            ),
                            text:
                                'If the sending bank supports instant payments, the payment will arrive in a few seconds. Otherwise, it will take up to 2 working days.',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextWidget(
                            icon: Icon(
                              Icons.flag_sharp,
                              size: 20,
                              color: Colors.black,
                            ),
                            text:
                                'If the sending bank supports instant payments, the payment will arrive in a few seconds. Otherwise, it will take up to 2 working days.',
                          ),
                        ],
                      ),
                    ),
                  ),

                  // This  widget created to  1- add Icon to text   2- to add text    we did this  to be a clean code you can find it in side *widget file*
                  // ***this is second tab  of tab bar    *****

                  // ***** card 1   *****
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        elevation: 8,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: SizedBox(
                          width: displayWidth(context) * .95,
                          height: 160,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 8,
                              ),
                              // This for anthor Tab of Tab bar is  Swift
                              // This  widget created to  1- add name   2- add value   you can find it in side *widget file*
                              SwiftWidget(
                                name: "Name",
                                copyValue: 
                                builder.accountsList.length > 0 ?
                        userController.accountsList[0].username:"",
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SwiftWidget(
                                name: 'IBAN',
                                copyValue: builder.accountsList.length > 0 ?
                        userController.accountsList[0].IBAN:"",
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SwiftWidget(
                                name: 'BIC',
                                copyValue: builder.accountsList.length > 0 ?
                        userController.accountsList[0].BIC:"",
                              ),
                            ],
                          ),
                        ),
                      ),

                      // / This  widget created to  1- add Icon to text   2- to add text    we did this  to be a clean code you can find it in side *widget file*
                      // ***this is second tab  of tab bar *****
                      // ***** card 2   *****
                      Card(
                        elevation: 8,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: SizedBox(
                          width: displayWidth(context) * .95,
                          height: 300,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              TextWidget(
                                icon: Icon(
                                  Icons.security,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                text:
                                    ' Your money is held and proctected by global banks.',
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 210),
                                child: Text(
                                  'Read more.',
                                  style: TextStyle(
                                      // height: 1.4,
                                      fontSize: 12,
                                      fontFamily: 'jannah',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                ),
                              ),
                              TextWidget(
                                icon: Image.asset('assets/database.png'),
                                text:
                                    'Use these details to receive your salary and transfers from a bank account.',
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextWidget(
                                icon: Icon(
                                  Icons.gavel_rounded,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                text:
                                    'Give these details to merchants to set up Direct Debitsand automatically pay off your recurring bills. ',
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextWidget(
                                icon: Icon(
                                  Icons.watch_later_rounded,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                text:
                                    'Transfers usually take 1 to 3 working days to appear on your Revolut account.',
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextWidget(
                                icon: Icon(
                                  Icons.flag_sharp,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                text: 'Only SWIFT transfers are accepted',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
    });
    
    // DefaultTabController    is widget to the TabBar  to toggle between to widget

  }
}
