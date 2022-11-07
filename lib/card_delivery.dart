import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/widgets/regular_button.dart';
import 'package:flutter/material.dart';

class CardDelivery extends StatelessWidget {
  const CardDelivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Wrap(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Get Your Physical Card Delivered',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: kTitleSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 100.0,
            ),
            Row(
              children:  [
                Expanded(
                  child: Text(
                    'Keep you wallet happy! withdraw cash from ATMs and pay with chip and PINS in-store',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 300,
              child: Image.asset('assets/images/cards.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Column(
                children: const [
                  MyRegularButton(
                    label: 'Order card',
                    width: 350,
                    height: 50,
                    color: Colors.white,
                    labelColor: Colors.black,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  MyRegularButton(
                    label: 'Not now',
                    width: 350,
                    height: 50,
                    color: Colors.black,
                    labelColor: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
