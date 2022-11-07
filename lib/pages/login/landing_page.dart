import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/pages/Login/models/code_field.dart';
import 'package:bnacash/pages/login/models/phone_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // final PageController _pageController = PageController(initialPage: 0);

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // leading: BackButton(
          //   color: kPrimaryColor,
          //   onPressed: () {
          //     _pageController.previousPage(
          //         duration: const Duration(milliseconds: 500),
          //         curve: Curves.ease);
          //   },
          // ),
          elevation: 0.0,
        ),
        body:
        // AnnotatedRegion<SystemUiOverlayStyle>(
        //   value: SystemUiOverlayStyle.light,
        //  child: PageView(
        //     physics: const ClampingScrollPhysics(),
            // controller: _pageController,
            // onPageChanged: (int page) {
            //   setState(() {
            //     currentPage = page;
            //   });


              PhoneField(
                // moveToNext: () {
                //   _pageController.nextPage(
                //     duration: const Duration(milliseconds: 500),
                //     curve: Curves.ease,
                //   );
                // },
              )
              // const CodeField()

        //   ),
        // )
  );
  }
}
