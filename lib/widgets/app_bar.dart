import 'package:bnacash/Controller/transaction_controller.dart';
import 'package:bnacash/Controller/userController.dart';
import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/models/graphtry.dart';
import 'package:bnacash/pages/Settings.dart';
import 'package:bnacash/pages/chatbot.dart';
import 'package:bnacash/pages/hi.dart';
import 'package:bnacash/pages/login/dialog.dart';
import 'package:bnacash/pages/login/models/dob.dart';
import 'package:bnacash/pages/shared/analytics_page.dart';
import 'package:bnacash/pages/shared/inbox_page.dart';
import 'package:bnacash/pages/shared/transaction_history.dart';
import 'package:bnacash/pages/verificationFailed.dart';
import 'package:bnacash/widgets/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

import '../models/graph.dart';
UserController userController = Get.put(UserController());
AikOr aikor = Get.put(AikOr());
DateTime _selectedDate = DateTime.now();
AppBar buildAppBar(context) => AppBar(
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.black),
      centerTitle: false,
      elevation: 0,
      title:  GestureDetector(
        onTap: () async{
         await userController.getDataForProfile(); 
          Get.to(ProfilePage());
        },
        child: CircleAvatar(
          child: Text('RA'),
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.white,
        ),
      ),
      actions: [
        
        SizedBox(
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //  MaterialButton(
              //   minWidth: 0,
              //   //color: Colors.transparent,
              //   child: const FaIcon(FontAwesomeIcons.airbnb),
              //   onPressed: () async {

              // //  await userController.hanodi();
              //   },
              // ),              
               MaterialButton(
                minWidth: 0,
                //color: Colors.transparent,
                child: const FaIcon(FontAwesomeIcons.message),
                onPressed: () async {
              //  await userController.hanodi();
              Get.to(DialogFlows());
              
              
                },
              ),
              MaterialButton(
                minWidth: 0,
                //color: Colors.transparent,
                child: const FaIcon(FontAwesomeIcons.addressBook),
                onPressed: () async {
                  await userController.getNotification();
                  Nav.toScreen(context,   TransactionHistory());
                  //  await  userController.ification();
                  // await userController.getVirtualCard();
                },
              ),
              // MaterialButton(
              //   minWidth: 0,
              //   //color: Colors.transparent,
              //   child: const FaIcon(FontAwesomeIcons.solidChartBar),
              //   onPressed: () async {
              //     SharedPreferences prefs =
              //         await SharedPreferences.getInstance();

              //     await prefs.remove('LoginInfo');
              //   },
              // ),
              MaterialButton(
                minWidth: 0,
                //color: Colors.transparent,
                child: const FaIcon(FontAwesomeIcons.solidChartBar),
                onPressed: () async{
                  // Nav.toScreen(context, const AnalyticsPage());
                  await userController.addAllNumbers();
                 // Nav.toScreen(context,  Paga());
                  await userController.graphTry();
                  Get.to(()=>Paga());
                  //ye konsi navigation use kar rahi ho 
                  
                },
              ),
              //    MaterialButton(
              //   minWidth: 0,
              //   //color: Colors.transparent,
              //   child: const FaIcon(FontAwesomeIcons.carBattery),
              //   onPressed: () {
              //     // Nav.toScreen(context, const AnalyticsPage());
              //     // Nav.toScreen(context,  BarChartSample1());
              //     userController.addAllNumbers();
                  
              //   },
              // ),

              
              MaterialButton(
                minWidth: 0,
                //color: Colors.transparent,
                child: const FaIcon(FontAwesomeIcons.gear),
                onPressed: () async {
                  await userController.getDataForProfile();
                  Nav.toScreen(context, Settingss());
                  // Get.put(ExampleHomePage());
                },
              ),
                      MaterialButton(
                minWidth: 0,
                //color: Colors.transparent,
                child: const FaIcon(FontAwesomeIcons.gear),
                onPressed: () async {
                  // await userController.getDataForProfile();
                  // Nav.toScreen(context, Settingss());

                  // Get.put(ExampleHomePage());
                },
              ),
              MaterialButton(
                minWidth: 0,
                //color: Colors.transparent,
                child: const FaIcon(FontAwesomeIcons.solidBell),
                onPressed: () async {
                  await userController.getNotification();

                  Nav.toScreen(context, const InboxPage());
                },
              ),
            ],
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: TabBar(
          labelPadding: const EdgeInsets.symmetric(horizontal: 8.0),
          isScrollable: false,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: Colors.black,
          labelColor: Colors.black,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          tabs: const [
            Tab(
              text: 'Accounts',
            ),
            Tab(
              text: 'Cards',
            ),
            Tab(
              text: 'Exchange',
            ),
            Tab(
              text: 'Crypto',
            ),
            Tab(
              text: 'Agencies',
            ),
          ],
        ),
      ),
    );
