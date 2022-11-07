import 'package:bnacash/constants/constants.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: kPrimaryColor,
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Settings",
                style: kAppBarTextStyle.copyWith(fontSize: 25),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/visa.png"))),
                      ),
                      title: const Text(
                        "VISA ··8326",
                        style: kContentTextStyle,
                      ),
                      subtitle: Text(
                        "Virtual",
                        style: kContentTextStyle.copyWith(fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Settings",
                style: kContentTextStyle,
              ),
              const SizedBox(height: 20),
              choiceField(
                  text: "Spending limit",
                  icon: "assets/images/fast.png",
                  subtitle: " Set a monthly dpending limit"),
              choiceField(
                  text: "Name you card",
                  icon: "assets/images/edit.png",
                  subtitle: "Add a custom name(optional)"),
              choiceField(
                  text: "Terminate card",
                  icon: "assets/images/delete.png",
                  subtitle: " The card will be be permanently terminated"),
            ],
          ),
        ),
      ),
    );
  }

  Widget choiceField({String? text, String? icon, String? subtitle}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          child: ListTile(
            leading: Image.asset(
              icon!,
              height: 25,
              width: 25,
              fit: BoxFit.contain,
            ),
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
