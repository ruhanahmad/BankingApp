import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/widgets/regular_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final List<ColorList> colorList = ColorList.colorList;

Color cColor = Colors.black;
Color mColor = Colors.grey;
Color cardColor = Colors.grey;

class CardDesign extends StatefulWidget {
  const CardDesign({Key? key}) : super(key: key);

  @override
  State<CardDesign> createState() => _CardDesignState();
}

class _CardDesignState extends State<CardDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        leading:  IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: (){
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
                    'Select Card Design',
                  style: TextStyle(
                    fontSize: kTitleSize,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              height: 300,
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.solidCreditCard,
                  size: MediaQuery.of(context).size.width * 0.60,
                  color: cardColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        mColor = Colors.black;
                        cColor = Colors.grey;
                      });
                      },
                    child: Text(
                      'Material',
                      style: TextStyle(
                        color: mColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20.0,),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        cColor = Colors.black;
                        mColor = Colors.grey;
                      });
                      },
                    child: Text(
                      'Color',
                      style: TextStyle(
                        color: cColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(colorList.length, (index) =>
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          cardColor = colorList[index].color;
                        });
                      },
                      child: CircleAvatar(
                  backgroundColor: colorList[index].color,
                  radius: 30,
                ),
                    ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: const [
                  Text(
                    'Premium plan required',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 15.0,),
                  MyRegularButton(
                    label: 'Get space gray premium card for FREE',
                    color: Colors.black,
                    width: 350,
                    height: 50,
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
