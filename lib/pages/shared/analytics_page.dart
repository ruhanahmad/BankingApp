import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/models/graph.dart';
import 'package:bnacash/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({Key? key}) : super(key: key);

  @override
  _AnalyticsPageState createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: scaffoldColor,
          // appBar: buildAppBar(context),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  textDivider(text: "Analytics"),
                  const SizedBox(
                    height: 10,
                  ),
                  Analytics(size: size),
                  const SizedBox(
                    height: 20,
                  ),
                  textDivider(text: "Trending Rewards"),
                  const SizedBox(
                    height: 10,
                  ),
                  Rewards(size: size)
                ],
              ),
            ),
          ),
        ));
  }

  Widget textDivider({String? text}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text!,
            style: kContentTextStyle,
            textAlign: TextAlign.left,
          ),
        ),
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "See all",
              style: kContentTextStyle.copyWith(
                color: kPrimaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Analytics extends StatelessWidget {
  const Analytics({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: const EdgeInsets.all(15.0),
          height: size.width * 0.5,
          width: size.width * 0.45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Spent this month",
                style: kContentTextStyle.copyWith(fontWeight: FontWeight.w500),
              ),
              Text(
                '0 TND',
                style: GoogleFonts.oxygen(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Spacer(),
              // const BarChartSample1()
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15.0),
          height: size.width * 0.5,
          width: size.width * 0.45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Track your spending and save more, set up a budget",
                style: kContentTextStyle.copyWith(fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 5.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.add_rounded, size: 20),
                          Text(
                            " Set up",
                            style: kContentTextStyle.copyWith(
                                fontSize: 13, color: kPrimaryColor),
                          )
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Rewards extends StatelessWidget {
  const Rewards({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(5.0),
        // height: size.width * 0.5,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        child: Wrap(
          children: [
            rewardItems(
                asset: "assets/images/banggood.png",
                label: "Banggood",
                value: "9%",
                fit: BoxFit.contain,
                size: size),
            rewardItems(
                asset: "assets/images/shein.png",
                label: "Shein",
                value: "10%",
                fit: BoxFit.contain,
                size: size),
            rewardItems(
                asset: "assets/images/myprotein.jpg",
                label: "Myprotein",
                value: "38%",
                fit: BoxFit.contain,
                size: size),
            rewardItems(
                asset: "assets/images/apple.png",
                label: "Apple",
                value: "3%",
                fit: BoxFit.contain,
                size: size),
            rewardItems(
                asset: "assets/images/farfetch.jpg",
                label: "FarFetch",
                value: "5%",
                fit: BoxFit.contain,
                size: size),
            rewardItems(
                asset: "assets/images/wish.png",
                label: "Wish",
                value: "40%",
                fit: BoxFit.contain,
                size: size),
            rewardItems(
                asset: "assets/images/ubereats.png",
                label: "Uber Eats",
                value: "50%",
                fit: BoxFit.contain,
                size: size),
            rewardItems(
                asset: "assets/images/lingokids.png",
                label: "LingoKids",
                value: "30%",
                fit: BoxFit.contain,
                size: size),
          ],
        ),
      ),
    );
  }

  Widget rewardItems({
    required String asset,
    required String label,
    required String value,
    required Size size,
    required BoxFit fit,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: size.width * 0.2,
        child: Column(
          children: [
            Container(
              height: size.width * 0.15,
              width: size.width * 0.12,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: kPrimaryColor, width: 2),
                  image: DecorationImage(fit: fit, image: AssetImage(asset))),
            ),
            Text(
              label,
              style: kContentTextStyle,
            ),
            Text(
              value,
              style: kContentTextStyle.copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
