import 'package:bnacash/pages/add_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'custom_button.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(15.0),
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyCustomButton(
                    label: 'Add Card',
                    width: 120,
                    height: 5,
                    icon: Icons.add,
                    pressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddCard()),
                      );
                    },
                  ),
                  const Spacer(),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: const Icon(
                      FontAwesomeIcons.creditCard,
                      color: Colors.deepPurple,
                      size: 30,
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Text(
                    'Virtual cards',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  const FaIcon(
                    FontAwesomeIcons.solidCreditCard,
                    color: Colors.lightBlueAccent,
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Virtual card 8326',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        'Ready to use',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  const FaIcon(
                    FontAwesomeIcons.solidCreditCard,
                    color: Colors.pinkAccent,
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Disposable virtual card',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        'For safe single use',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: const [
                  Text(
                    'Physical cards',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.solidCreditCard,
                    color: Colors.grey.withOpacity(0.3),
                    size: 15,
                  ),
                  const SizedBox(
                    width: 18.0,
                  ),
                  Text(
                    'Paypal cards will appear here',
                    style: TextStyle(color: Colors.grey.withOpacity(0.3)),
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 300.0,
        ),
        // const Spacer(),
        SizedBox(
          width: 180,
          child: MaterialButton(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            //minWidth: 15,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: () {},
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('R',
                    style: GoogleFonts.londrinaOutline(
                      textStyle: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )),
                const FaIcon(
                  Icons.compare_arrows_rounded,
                  color: Colors.grey,
                ),
                const FaIcon(
                  Icons.border_all_outlined,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
