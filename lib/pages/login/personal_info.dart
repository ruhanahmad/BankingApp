// ignore_for_file: file_names

import 'package:bnacash/Controller/userController.dart';
import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/pages/login/find_friends.dart';
import 'package:bnacash/pages/login/models/address.dart';
import 'package:bnacash/pages/login/models/country.dart';
import 'package:bnacash/pages/login/models/dob.dart';
import 'package:bnacash/pages/login/models/email.dart';
import 'package:bnacash/pages/login/models/name.dart';
import 'package:bnacash/pages/login/models/occupation.dart';
import 'package:bnacash/pages/login/models/phone_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bnacash/pages/login/landing_page.dart';
import 'package:get/get.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final PageController _pageController = PageController(initialPage: 0);

  int currentPage = 0;
  final int _numPages = 6;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 10.0,
      width: isActive ? 24.0 : 10.0,
      decoration: BoxDecoration(
        color: isActive ? kPrimaryColor : const Color(0xFF959595),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          // leading: BackButton(
          //   color: kPrimaryColor,
          //   onPressed: () {
          //     if (currentPage == 0) {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //               builder: (context) => const LandingPage()));
          //     } else {
          //       _pageController.previousPage(
          //           duration: const Duration(milliseconds: 500),
          //           curve: Curves.ease);
          //     }
          //   },
          // ),
          elevation: 0.0,
        ),
        body: 
        // AnnotatedRegion<SystemUiOverlayStyle>(
        //   value: SystemUiOverlayStyle.light,
          // child: 
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CountryField(),
                  // SingleChildScrollView(
                  //   child: SizedBox(
                  //     height: MediaQuery.of(context).size.height * 0.8,
                  //     child: PageView(
                  //       physics: const ClampingScrollPhysics(),
                  //       controller: _pageController,
                  //       onPageChanged: (int page) {
                  //         setState(() {
                  //           currentPage = page;
                  //         });
                  //       },
                  //       children: const [
                  //         CountryField(),
                  //         HomeAddress(),
                  //         NameField(),
                  //         DobField(),
                  //         EmailField(),
                  //         OccupationField()
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Expanded(
                  //   child: Align(
                  //     alignment: FractionalOffset.bottomRight,
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Row(
                  //           children: _buildPageIndicator(),
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.all(8.0),
                  //           child: SizedBox(
                  //             width: currentPage == _numPages - 1 ? 170 : 60,
                  //             child: ElevatedButton(
                  //               style: ElevatedButton.styleFrom(
                  //                 padding: const EdgeInsets.symmetric(
                  //                     vertical: 10.0, horizontal: 8.0),
                  //                 elevation: 5.0,
                  //                 primary: kPrimaryColor,
                  //                 shape: RoundedRectangleBorder(
                  //                     borderRadius:
                  //                         BorderRadius.circular(50.0)),
                  //               ),
                  //               onPressed: () async{
                  //                await userController.uploadData();
                  //                 // if (currentPage == _numPages - 1) {
                  //                 //   Navigator.push(
                  //                 //       context,
                  //                 //       PageRouteBuilder(
                  //                 //           transitionDuration: const Duration(
                  //                 //               milliseconds: 1000),
                  //                 //           transitionsBuilder:
                  //                 //               (BuildContext context,
                  //                 //                   Animation<double> animation,
                  //                 //                   Animation<double>
                  //                 //                       secondaryAnimation,
                  //                 //                   Widget? child) {
                  //                 //             animation = CurvedAnimation(
                  //                 //                 parent: animation,
                  //                 //                 curve: Curves.elasticInOut);
                  //                 //             return ScaleTransition(
                  //                 //               alignment: Alignment.center,
                  //                 //               scale: animation,
                  //                 //               child: child,
                  //                 //             );
                  //                 //           },
                  //                 //           pageBuilder: (BuildContext context,
                  //                 //               Animation<double> animation,
                  //                 //               Animation<double>
                  //                 //                   secondaryAnimation)  { 
                                                                                                
                                             
                  //                 //       return    const FindFriends();
                  //                 //                   }
                                            
                  //                 //           ));
                  //                 // } else {
                  //                 //   _pageController.nextPage(
                  //                 //     duration:
                  //                 //         const Duration(milliseconds: 500),
                  //                 //     curve: Curves.ease,
                  //                 //   );
                  //                 // }
                  //               },
                  //               child: Row(
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 children: [
                  //                   Text(
                  //                     // currentPage == _numPages - 1
                  //                         // ? 
                  //                         'DONE',
                  //                         // : "",
                  //                     style: const TextStyle(
                  //                       color: Colors.white,
                  //                       fontSize: 16.0,
                  //                       fontWeight: FontWeight.bold,
                  //                     ),
                  //                   ),
                  //                   const Icon(
                  //                     Icons.keyboard_arrow_right,
                  //                     color: kBackgroundColor,
                  //                     size: 40.0,
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        // )
        );
  }
}
