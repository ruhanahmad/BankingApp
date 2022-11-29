import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/pages/login/scanCamera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProofPage extends StatefulWidget {
  const ProofPage({Key? key}) : super(key: key);

  @override
  _ProofPageState createState() => _ProofPageState();
}

class _ProofPageState extends State<ProofPage> {
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
              "Proof of residency",
              style: kAppBarTextStyle.copyWith(fontSize: 25),
            ),
            const SizedBox(height: 10),
            const Text(
              "Prove you live in Tunisia",
              style: kContentTextStyle,
            ),
            const SizedBox(height: 20),
            const Text(
              "Nationality",
              style: kContentTextStyle,
            ),
            const SizedBox(height: 20),
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
                        height: 30,
                        width: 30,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage("assets/images/tunisia.png"))),
                      ),
                      title: const Text(
                        "Tunisian",
                        style: kContentTextStyle,
                      ),
                      trailing: Container(
                          decoration: BoxDecoration(
                              color: kSecondaryColor.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            child: Text(
                              "Change",
                              style: kContentTextStyle,
                            ),
                          ))),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Document to submit securely",
              style: kContentTextStyle,
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: ( ) {
                Get.to(ExampleCameraOverlay(title:"driving"));
              },
              child: choiceField(text: "Driving license", icon: Icons.car_rental)),
            GestureDetector(
                 onTap: ( ) {
                Get.to(ExampleCameraOverlay(title:"passport"));
              },
              
              child: choiceField(text: "Passport", icon: Icons.perm_identity)),
            choiceField(
                text: "Identity card", icon: Icons.person_add_alt_outlined),
          ],
        ),
      ),
    );
  }

  Widget choiceField({String? text, IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          child: ListTile(
              leading: Icon(icon),
              title: Text(
                text!,
                style: kContentTextStyle,
              ),
              subtitle: Text(
                "Issued in France",
                style: kContentTextStyle.copyWith(fontSize: 14),
              ),
              trailing: const Icon(Icons.arrow_forward_ios_rounded)),
        ),
      ),
    );
  }
}
