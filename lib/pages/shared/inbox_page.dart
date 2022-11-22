import 'package:bnacash/Controller/userController.dart';
import 'package:bnacash/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({Key? key}) : super(key: key);

  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  final userController = Get.put(UserController());
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
                "Inbox",
                style: kAppBarTextStyle.copyWith(fontSize: 25),
              ),
              const SizedBox(height: 20),
              const Text(
                "Yesterday",
                style: kContentTextStyle,
              ),
              notificationField(
                  text: userController.notificationList![0]["username"],
                  icon: "assets/images/tunisia.png",
                  subtitle:
                      userController.notificationList![0]["balance"]),
             SizedBox(height: 10),
             Text(
                userController.notificationList![0]["dateTime"]
                ,
                style: kContentTextStyle,
              ),
              notificationField(
                  text: "Add money confidently",
                  icon: "assets/images/visa.png",
                  subtitle:
                      "Data security and spend protection are our priorities.\nLearn more"),
              const SizedBox(height: 10),
              const Text(
                "October 3",
                style: kContentTextStyle,
              ),
              notificationField(
                  text: "Keep your money with us.",
                  icon: "assets/images/contacts.png",
                  subtitle:
                      "Our customers trust us with their money. Learn more"),
              const SizedBox(height: 10),
              const Text(
                "October 1",
                style: kContentTextStyle,
              ),
              notificationField(
                  text: "Don't leave us hanging!",
                  icon: "assets/icons/icon.png",
                  subtitle:
                      "Add money to start exploring the revolutionary features we have to offer."),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget notificationField({String? text, String? icon, String? subtitle}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(
                icon!,
              ),
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
