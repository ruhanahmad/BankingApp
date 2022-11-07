import 'package:bnacash/widgets/card_container.dart';
import 'package:flutter/material.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SafeArea(
        child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children:  const [
                    // Padding(
                    //   padding: EdgeInsets.only(top: 16.0),
                    //   child: CustomBar(),
                    // ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: CardContainer(),
                    ),
                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }
}
