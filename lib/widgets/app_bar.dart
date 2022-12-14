import 'package:bnacash/Controller/userController.dart';
import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/pages/Settings.dart';
import 'package:bnacash/pages/chatbot.dart';
import 'package:bnacash/pages/hi.dart';
import 'package:bnacash/pages/shared/analytics_page.dart';
import 'package:bnacash/pages/shared/inbox_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
UserController userController = Get.put(UserController());
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
                child: const FaIcon(FontAwesomeIcons.addressBook),
                onPressed: ()async {
                  // Nav.toScreen(context,   ChatBot());
              //  await  userController.getNotification();
              await userController.getVirtualCard();
                },
              ),
              MaterialButton(
                minWidth: 0,
                //color: Colors.transparent,
                child: const FaIcon(FontAwesomeIcons.solidChartBar),
                onPressed: () async{
                   SharedPreferences prefs = await SharedPreferences.getInstance();
 
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
                child: const FaIcon(FontAwesomeIcons.solidStar),
                onPressed: () {
                  Nav.toScreen(context,  Settingss());
                  // Get.put(ExampleHomePage());
                },
              ),
              MaterialButton(
                minWidth: 0,
                //color: Colors.transparent,
                child: const FaIcon(FontAwesomeIcons.solidBell),
                onPressed: ()async {
               await   userController.getNotification();
               
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
              text: 'Stocks',
            ),
            Tab(
              text: 'Crypto',
            ),
            Tab(
              text: 'Vaults',
            ),
          ],
        ),
      ),
    );
