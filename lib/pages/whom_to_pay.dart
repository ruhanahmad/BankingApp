import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/pages/account_detail.dart';
import 'package:bnacash/widgets/custom_buttonn.dart';
import 'package:bnacash/widgets/cutom_heading.dart';
import 'package:flutter/material.dart';

class WhomToPay extends StatefulWidget {
  const WhomToPay({Key? key}) : super(key: key);

  @override
  State<WhomToPay> createState() => _WhomToPayState();
}

class _WhomToPayState extends State<WhomToPay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf3f4f6),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            left: 5,
            right: 10,
            top: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // action bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BackButton(color: Color(0xFF27282a)),
                  Row(
                    children: [
                      const Icon(Icons.search, color: Color(0xFF27282a)),
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(Icons.person, color: Color(0xFF27282a)),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          Nav.toScreen(context, const AccountDetail());
                          // showModalBottomSheet(
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(12.0),
                          //     ),
                          //     context: context,
                          //     builder: (context) => sheet());
                        },
                        icon: const Icon(Icons.add),
                        label: const Text("New"),
                        style: ElevatedButton.styleFrom(
                          onPrimary: const Color(0xFFffffff),
                          primary: const Color(0xFF095fd8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // Main Heading
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: TopHeading(
                  heading: "Whom to Pay",
                ),
              ),
              // For buttons
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Row(
                  children: const [
                    CustomBtn(text: "R"),
                    CustomBtn(text: "Contacts"),
                    CustomBtn(text: "Accounts"),
                  ],
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  child: Text(
                    "All",
                    style: TextStyle(
                      color: Color(0xFFb6b9c0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // for making contact listTile
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0)),
                  child: const ListTile(
                    leading: Icon(Icons.person),
                    title: Text(
                      "Your contact list is empty. Contacts will appear when you add them.",
                      style: TextStyle(
                          color: Color(0xFF83888c),
                          fontWeight: FontWeight.w500),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

// For modal bottom sheet display screen
Widget sheet() => Column(children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: const Color(0xFFd9d7d7),
          ),
          height: 5,
          width: 50,
        ),
      ),
      const ListSheet(
        title: "Create Payment Method",
        subtitle: "Send money to anyone with a link",
        icons: Icon(
          Icons.link,
          color: Color(0xFF096df9),
          size: 18,
        ),
      ),
      const ListSheet(
        title: "Add a bank recipient",
        subtitle: "Transfer money to nay bank account",
        icons: Icon(
          Icons.account_balance,
          color: Color(0xFF096df9),
          size: 18,
        ),
      ),
      const ListSheet(
        title: "Invite a friend",
        subtitle: "Share a link to join Revolut",
        icons: Icon(
          Icons.favorite,
          color: Color(0xFF096df9),
          size: 18,
        ),
      ),
      const ListSheet(
        title: "Add a contact",
        subtitle: "Add a contact using phone or emial",
        icons: Icon(
          Icons.person,
          color: Color(0xFF096df9),
          size: 18,
        ),
      ),
    ]);

// for modal bottom sheet listTile
class ListSheet extends StatelessWidget {
  final String title;
  final String subtitle;
  final Icon icons;
  const ListSheet(
      {Key? key,
      required this.icons,
      required this.subtitle,
      required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFe4f0fe),
          child: icons,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Color(0xFF096df9),
            fontWeight: FontWeight.w700,
            fontSize: 17,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
              color: Color(0xFFb7b8ba),
              fontWeight: FontWeight.w500,
              fontSize: 15),
        ),
      ),
    );
  }
}
