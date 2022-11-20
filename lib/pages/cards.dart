import 'package:bnacash/Controller/userController.dart';
import 'package:bnacash/card_design.dart';
import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/pages/shared/settings_page.dart';
import 'package:bnacash/widgets/cutom_heading.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:bnacash/Controller/userController.dart';
class Cards extends StatefulWidget {
  const Cards({Key? key}) : super(key: key);

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
   
  @override
  Widget build(BuildContext context) {
   final userController = Get.put(UserController());
    return Scaffold(
      backgroundColor: const Color(0xFFf3f4f6),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 5, right: 10, top: 20),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                // to navigate screen
                GestureDetector(child: const Icon(Icons.arrow_back)),
                Row(
                  children: [
                    const Icon(
                      Icons.swap_vert,
                      size: 26,
                    ),
                    MaterialButton(
                      onPressed: () {
                      Get.to(CardDesign());
                      },
                      color: const Color(0xFF006ee8),
                      textColor: Colors.white,
                      child: const Icon(
                        Icons.add,
                        size: 20,
                      ),
                      padding: const EdgeInsets.all(8.0),
                      shape:  CircleBorder(),
                    ),
                  ],
                ),
              ]),
              // main heading
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: TopHeading(
                  heading: "Cards",
                ),
              ),
              //  for display CarouselSlider

             userController.isChecked  == false ?
              Container(child: Column(children: [
             CarouselSlider(
                  options: CarouselOptions(
                    // height: 180.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                  items: [
                    // don't have real pictures so i use this from internet
                    //
                    Stack(
                      children: [
                        Image.asset('assets/images/bloack-credit-card.png'),
                        // for visible icon
                        const CircleAvatar(
                            radius: 17,
                            backgroundColor: Color(0xFFe8e9ee),
                            child: Icon(
                              Icons.visibility,
                              color: Color(0xFF858c94),
                              size: 19,
                            ))
                      ],
                    ),
                    // Container(
                    //   child: Image.network('assets/images/index.jpg'),
                    // ),
                  ]),

                        Container(
                margin: const EdgeInsets.only(top: 20),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Start shopping online",
                          style: TextStyle(
                              color: Color(0xFF262626),
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                        ),
                        Icon(Icons.info_outline_rounded)
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: Text(
                        "Use this card to make more secure online transactions",
                        style: TextStyle(color: Color(0xFF9b9fa2)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0)),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Color(0xFF0356e0),
                          child: Icon(
                            Icons.ac_unit,
                            color: Colors.white,
                          ),
                        ),
                        title: Text(
                          "Unfreeze card",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Color(0xFF0356e0),
                        child: Icon(Icons.settings, color: Colors.white),
                      ),
                      title: const Text(
                        "Settings",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      subtitle:
                          const Text("Terminate or rename  card and more"),
                      onTap: () {
                        Nav.toScreen(context, const SettingsPage());
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              )
              ],
              ),
              ):Text("Add Card")
 
        
              
            ],
          ),
        ),
      ),
    );
  }
}
