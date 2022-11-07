import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/pages/plan_screens/metal_plan.dart';
import 'package:bnacash/pages/plan_screens/plus_plan.dart';
import 'package:bnacash/pages/plan_screens/premium_plan.dart';
import 'package:bnacash/pages/plan_screens/standard_plan.dart';
import 'package:flutter/material.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          backgroundColor: scaffoldColor,
          appBar: AppBar(
            centerTitle: false,
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
            title: Text(
              'Select Plan',
              style: TextStyle(
                color: Colors.black,
                fontSize: kTitleSize - 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(80.0),
              child: TabBar(
                labelPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                isScrollable: false,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                ),
                tabs: const [
                  Tab(
                    text: 'Standard',
                  ),
                  Tab(
                    text: 'Metal',
                  ),
                  Tab(
                    text: 'Premium',
                  ),
                  Tab(
                    text: 'Plus',
                  ),
                ],
              ),
            ),
          ),
          body: const TabBarView(
            children: [StandardPlan(), PremiumPlan(), MetalPlan(), PlusPlan()],
          )),
    );
  }
}
