import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/models/primary_button.dart';
import 'package:bnacash/pages/login/proof_of_residency.dart';
import 'package:flutter/material.dart';

class NotificationsField extends StatefulWidget {
  const NotificationsField({Key? key}) : super(key: key);

  @override
  _NotificationsFieldState createState() => _NotificationsFieldState();
}

class _NotificationsFieldState extends State<NotificationsField> {
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
              "Don't Miss a beat",
              style: kAppBarTextStyle.copyWith(fontSize: 25),
            ),
            const SizedBox(height: 10),
            const Text(
              "Get Notified about spending, security,wealth, market movements, discount and deals, so you're always in the know",
              style: kContentTextStyle,
            ),
            const SizedBox(height: 20),
            Center(
              child: Opacity(
                opacity: 0.75,
                child: Image.asset(
                  "assets/images/notifications.png",
                  height: 90,
                  width: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Spacer(),
            PrimaryButton(
              text: "Enable push notifications",
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
                          return const ProofPage();
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
                          return const ProofPage();
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
