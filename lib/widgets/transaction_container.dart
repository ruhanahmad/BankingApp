import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/pages/add_money.dart';
import 'package:bnacash/pages/login/models/dob.dart';
import 'package:bnacash/pages/second_screen.dart';
import 'package:bnacash/pages/whom_to_pay.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'custom_button.dart';
import 'package:bnacash/Controller/userController.dart';

class TransactionContainer extends StatefulWidget {
  const TransactionContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<TransactionContainer> createState() => _TransactionContainerState();
}

class _TransactionContainerState extends State<TransactionContainer> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userController.getAccountData();
  }
  @override
  Widget build(BuildContext context) {
   UserController userController = Get.put(UserController());
   

    return 
    
    GetBuilder<UserController>
      
    (

      init: UserController(),
      
      builder:( builder)
    
    {
    return 

     Container(
      padding: const EdgeInsets.all(15.0),
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        // '0 TND',
                        builder.balances == null ? "0":builder.balances ,
                        // builder.accountsList[0].accountB,
                        // builder.accountsList.length > 0 ?
                        // builder.accountsList[0].accountB :"",
                        style: GoogleFonts.oxygen(
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text("TND"),
                      IconButton(onPressed: (){
                        builder.getAccountData();
                      }, icon: Icon(Icons.zoom_in))
                    ],
                  ),
                  const Text(
                    'Dinar',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () => Nav.toScreen(context, const Secondscreen()),
                child: const CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/images/tunisia.png",
                  ),
                  radius: 25,
                ),
              ),
            ],
          ),
          Row(
            children: [
              MyCustomButton(
                label: 'Add Money',
                width: 150,
                height: 5,
                icon: Icons.add,
                pressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AddMoney()),
                  );
                },
              ),
              MyCustomButton(
                label: 'Send',
                width: 90,
                height: 5,
                icon: Icons.arrow_forward,
                pressed: () {
                  Nav.toScreen(context, const WhomToPay());
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blueGrey.withOpacity(0.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fixedSize: const Size(60, 5),
                  ),
                  child: const Icon(
                    FontAwesomeIcons.ellipsisH,
                    size: 15,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            child: Text(
              'Transactions',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 15.0),
            child: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.solidClock,
                  size: 22,
                  color: Colors.grey.withOpacity(0.3),
                ),
                const SizedBox(width: 8.0),
                Text(
                  'No transactions yet',
                  style: TextStyle(
                      color: Colors.grey.withOpacity(0.3),
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    });
    
   
  }
}
