import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/pages/login/auth_page.dart';
import 'package:bnacash/pages/login/models/dob.dart';
import 'package:bnacash/pages/login/proof_of_residency.dart';
import 'package:flutter/material.dart';

class ReasonForUse extends StatefulWidget {
  const ReasonForUse({Key? key}) : super(key: key);

  @override
  _ReasonForUseState createState() => _ReasonForUseState();
}

class _ReasonForUseState extends State<ReasonForUse> {
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
              "Main reason for using BNA cash",
              style: kAppBarTextStyle.copyWith(fontSize: 25),
            ),
            const SizedBox(height: 10),
            const Text(
              "We need to know this for regulatory reasons. And also we are curious.",
              style: kContentTextStyle,
            ),
            const SizedBox(height: 20),
            choiceField("Spend or save daily"),
            choiceField("Send money"),
            choiceField("Spend while travelling"),
            choiceField("Gain exposure to financial assets"),
          ],
        ),
      ),
    );
  }

  Widget choiceField(String text) {
    return InkWell(
      onTap: () {
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
                pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) {
                  return const ProofPage();
                }));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15.0)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            child: ListTile(
                title: Text(
                  text,
                  style: kContentTextStyle,
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded)),
          ),
        ),
      ),
    );
  }
}
