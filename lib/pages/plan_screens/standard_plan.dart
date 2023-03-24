import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/widgets/custom_button.dart';
import 'package:bnacash/widgets/regular_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StandardPlan extends StatelessWidget {
  const StandardPlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15.0),
            height: 220,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your financial life, in\none app',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: kTitleSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              children: [
                Text(
                  'Standard',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: kTitleSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                MyCustomButton(
                  label: 'Active',
                  icon: Icons.flash_on,
                  width: 100,
                  height: 5,
                  pressed: () {},
                )
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.angleDown,
                  color: Colors.blue,
                ),
                onPressed: () {},
              ),
              const Text(
                'Everyday benefits',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              const Icon(
                Icons.shopping_bag,
                size: 30,
              ),
              const SizedBox(
                width: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Revolut Junior',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Create 1 junior account and get limited feature access.',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              const FaIcon(
                FontAwesomeIcons.solidCreditCard,
              ),
              const SizedBox(
                width: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Standard Card',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Get a free  with 0 monthly fee. Deliver\nfee may apply',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.angleDown,
                  color: Colors.blue,
                ),
                onPressed: () {},
              ),
              const Text(
                'Investments',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: MyRegularButton(
              label: 'Get free standard',
              labelColor: Colors.white,
              color: Colors.blue,
              width: 350,
              height: 50,
            ),
          )
        ],
      ),
    );
  }
}
