import 'package:bnacash/Controller/userController.dart';
import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/pages/Settings.dart';
import 'package:bnacash/pages/chatbot.dart';
import 'package:bnacash/pages/hi.dart';
import 'package:bnacash/pages/shared/analytics_page.dart';
import 'package:bnacash/pages/shared/inbox_page.dart';
import 'package:bnacash/pages/shared/transaction_history.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
UserController userController = Get.put(UserController());
DateTime _selectedDate = DateTime.now();
AppBar buildAppBar(context) => AppBar(
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.black),
      centerTitle: false,
      elevation: 0,
      title: const CircleAvatar(
        child: Text('RA'),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      actions: [
        
        SizedBox(
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
               MaterialButton(
                minWidth: 0,
                //color: Colors.transparent,
                child: const FaIcon(FontAwesomeIcons.airbnb),
                onPressed: () async {
                 SizedBox(
            height: 250,
            child: ScrollDatePicker(
              selectedDate: _selectedDate,
              locale: Locale('en'),
              onDateTimeChanged: (DateTime value) {
               
                  _selectedDate = value;
                  userController.update();
              
              },
            ),
          );
              //  await userController.hanodi();
                },
              ),              
               MaterialButton(
                minWidth: 0,
                //color: Colors.transparent,
                child: const FaIcon(FontAwesomeIcons.gasPump),
                onPressed: () async {
               await userController.hanodi();
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
              MaterialButton(
                minWidth: 0,
                //color: Colors.transparent,
                child: const FaIcon(FontAwesomeIcons.solidChartBar),
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();

                  await prefs.remove('LoginInfo');
                },
              ),
              MaterialButton(
                minWidth: 0,
                //color: Colors.transparent,
                child: const FaIcon(FontAwesomeIcons.solidChartBar),
                onPressed: () {
                  Nav.toScreen(context, const AnalyticsPage());
                },
              ),
              MaterialButton(
                minWidth: 0,
                //color: Colors.transparent,
                child: const FaIcon(FontAwesomeIcons.gear),
                onPressed: () {
                  Nav.toScreen(context, Settingss());
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
