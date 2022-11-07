import 'package:bnacash/constants/constants.dart';

import 'package:bnacash/widgets/regular_button.dart';

import 'package:flutter/material.dart';

class VirtualDelivery extends StatelessWidget {
  const VirtualDelivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
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
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  ' Your virtual debit Card is \n ready! ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: kTitleSize,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: const [
                Text(
                  'Start spending securely the right way. Add your virtual\n card to google play to make easy in-store purchases',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 35.0),
              height: 380,
              child: Image.asset('assets/images/cards.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35.0),
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
                    label: 'Add to google pay',
                    width: 350,
                    height: 50,
                    color: Colors.black,
                    labelColor: Colors.white,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
