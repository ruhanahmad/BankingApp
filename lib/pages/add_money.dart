import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/pages/prepaid_card.dart';
import 'package:bnacash/widgets/regular_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bnacash/pages/card.dart';
import 'package:get/get.dart';

class AddMoney extends StatelessWidget {
  const AddMoney({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Add money',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: kTitleSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(
                    Icons.security,
                    size: 20,
                    color: Color.fromARGB(255, 25, 25, 26),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    'Your money is protected by licensed banks',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // const SizedBox(
              //   height: 30.0,
              // ),

              // const SizedBox(
              //   height: 25.0,
              // ),
              Container(
                padding: const EdgeInsets.all(12.0),
                height: 85,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    // FloatingActionButton(
                    //   backgroundColor: Colors.blueGrey.withOpacity(0.2),
                    //   child: const FaIcon(
                    //     FontAwesomeIcons.solidCreditCard,
                    //     color: Colors.blue,
                    //   ),
                    //   elevation: 0,
                    //   onPressed: () {},
                    // ),
                           const SizedBox(
                      width: 12.0,
                    ),
                
              
                
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Enter Prepaid Code',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          'Prepaid Code ',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    TextButton(
                      child:  Text(
                        'Change',
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blueGrey.withOpacity(0.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          fixedSize: const Size(80, 5)),
                      onPressed: () {
                        // Nav.toScreen(context, const MyCard());
                        Nav.toScreen(context, const PrepaidCard());
                
                
                        
                      },
                    )
                  ],
                ),
              ),
                
              
                
                
                            Container(
                padding: const EdgeInsets.all(12.0),
                height: 85,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    // FloatingActionButton(
                    //   backgroundColor: Colors.blueGrey.withOpacity(0.2),
                    //   child: const FaIcon(
                    //     FontAwesomeIcons.solidCreditCard,
                    //     color: Colors.blue,
                    //   ),
                    //   elevation: 0,
                    //   onPressed: () {},
                    // ),
                           const SizedBox(
                      width: 12.0,
                    ),
                
               const Spacer(),

                                         const SizedBox(
                      height: 12.0,
                    ),
                
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Text(
                          'Debit or credit card',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          'Card details added securely ',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    TextButton(
                      child: const Text(
                        'Change',
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blueGrey.withOpacity(0.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          fixedSize: const Size(80, 5)),
                      onPressed: () {
                        Nav.toScreen(context, const MyCard());
                      },
                    )
                  ],
                ),
              ),
              const Spacer(),
              const MyRegularButton(
                label: 'Add money',
                width: 350,
                height: 50,
                color: Colors.blue,
                labelColor: Colors.white,
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
