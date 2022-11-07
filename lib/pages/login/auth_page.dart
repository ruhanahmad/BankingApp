import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/models/primary_button.dart';
import 'package:bnacash/pages/login/notifications.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: kPrimaryColor,
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Log in with Face ID",
              style: kAppBarTextStyle.copyWith(fontSize: 25),
            ),
            const SizedBox(height: 10),
            const Text(
              "Use Face ID instead of a paascode to log in. It's more secure.",
              style: kContentTextStyle,
            ),
            const SizedBox(height: 20),
            Center(
              child: Opacity(
                opacity: 0.75,
                child: Image.asset(
                  "assets/images/auth.png",
                  height: 90,
                  width: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Spacer(),
            PrimaryButton(
              text: "Enable Face Id",
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 1000),
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {
                          animation = CurvedAnimation(
                              parent: animation, curve: Curves.elasticInOut);
                          return ScaleTransition(
                            alignment: Alignment.center,
                            scale: animation,
                            child: child,
                          );
                        },
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return const NotificationsField();
                        }));
              },
            ),
            PrimaryButton(
              text: "Not Now",
              color: kSecondaryColor,
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 1000),
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {
                          animation = CurvedAnimation(
                              parent: animation, curve: Curves.elasticInOut);
                          return ScaleTransition(
                            alignment: Alignment.center,
                            scale: animation,
                            child: child,
                          );
                        },
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return const NotificationsField();
                        }));
              },
            ),
            const SizedBox(
              height: 5.0,
            )
          ],
        ),
      ),
    );
  }
}
