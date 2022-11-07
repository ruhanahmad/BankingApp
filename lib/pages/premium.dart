import 'package:bnacash/pages/second_screen.dart';
import 'package:bnacash/card_delivery.dart';
import 'package:flutter/material.dart';

class Premium extends StatefulWidget {
  const Premium({Key? key}) : super(key: key);

  @override
  _PremiumState createState() => _PremiumState();
}

class _PremiumState extends State<Premium> {
  bool toggle = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: size.height * 0.83,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                          right: MediaQuery.of(context).size.width * 0.6),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Secondscreen()));
                          },
                          child: const Text(
                            "\n    Select Plan",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.height * 0.95,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            videoPlayer(size.width, size.height),
                            videoPlayer(size.width, size.height),
                            videoPlayer(size.width, size.height),
                            videoPlayer(size.width, size.height),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.05,
                          top: MediaQuery.of(context).size.height * 0.04),
                      child: const Text(
                        'Premium',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 18,
                          top: MediaQuery.of(context).size.height * 0.045),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                toggle = !toggle;
                              });
                            },
                            icon: (toggle == false)
                                ? const Icon(
                                    Icons.arrow_drop_down,
                                    color: Color(0xFF096bf0),
                                  )
                                : const Icon(
                                    Icons.arrow_right,
                                    color: Color(0xFF096bf0),
                                  ),
                          ),
                          const Text(
                            '\t\t\t    Everyday benefits',
                            style: TextStyle(
                                color: Color(0xFF096bf0),
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    (toggle == false)
                        ? Padding(
                            padding: EdgeInsets.only(
                                left: size.width * 0.08,
                                top: MediaQuery.of(context).size.height * 0.03),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/visa.png',
                                  fit: BoxFit.fill,
                                  width: size.width * 0.2,
                                  scale: 1.5,
                                ),
                                const Text(
                                  '\t\t\t\t  Personalised Metal Card',
                                  style: TextStyle(
                                      color: Color(0xFFacb4bd),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.06,
                          bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'By proceeding you agree to the',
                            style: TextStyle(
                                color: Color(0xffacb4bd), fontSize: 13),
                          ),
                          Text(
                            ' Terms & conditions ',
                            style: TextStyle(
                                color: Color(0xFF096bf0), fontSize: 13),
                          ),
                          Text(
                            'and',
                            style: TextStyle(
                                color: Color(0xffacb4bd), fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    const Center(
                        child: Text(
                      'Insurance Documents.',
                      style: TextStyle(color: Color(0xFF096bf0), fontSize: 13),
                    )),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CardDelivery()),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                  color: const Color(0xFF096bf0),
                  border: Border.all(
                    color: const Color(0xFF096bf0),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                    child: Text(
                  'Get Premium From 7.99 TND/pm ',
                  style: TextStyle(color: Colors.white),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget videoPlayer(double w, double h) {
    return Stack(
      children: [
        Container(
          width: w * 1,
          height: h * 0.4,
          padding: EdgeInsets.only(right: w * 0.02),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/sales.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: h * 0.01, left: w * 0.78),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.play_circle_outline_outlined,
                size: 45,
                color: Colors.white,
              )),
        ),
        Padding(
          padding: EdgeInsets.only(top: h * 0.32, left: w * 0.06),
          child: const Text(
            'For a global Lifestyle',
            style: TextStyle(
                color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
