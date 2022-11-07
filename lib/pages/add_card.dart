import 'package:bnacash/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math' as math;

class AddCard extends StatelessWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Transform.rotate(
            angle: 90 * math.pi / 180,
            child: IconButton(
              iconSize: 18,
              icon: const FaIcon(
                FontAwesomeIcons.exchangeAlt,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          SizedBox(
            width: 35,
            height: 35,
            child: FloatingActionButton(
              elevation: 0,
              child: const Icon(Icons.add),
              onPressed: () {},
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      backgroundColor: scaffoldColor,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Cards',
                  style: TextStyle(
                    fontSize: kTitleSize,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.all(16.0),
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Start shopping online',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Use this card to make more secure online transactions',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.info_outline,
                      color: Colors.grey,
                    )
                  ],
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                height: 140,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          child: Icon(FontAwesomeIcons.snowflake),
                          radius: 20,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Unfreeze card',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const CircleAvatar(
                          child: Icon(Icons.settings),
                          radius: 20,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Settings',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Terminate or rename card and more',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
