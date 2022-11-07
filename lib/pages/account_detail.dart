import 'package:bnacash/pages/business_tab_bar.dart';
import 'package:bnacash/pages/individual.dart';
import 'package:bnacash/widgets/cutom_heading.dart';
import 'package:flutter/material.dart';

class AccountDetail extends StatefulWidget {
  const AccountDetail({Key? key}) : super(key: key);

  @override
  State<AccountDetail> createState() => _AccountDetailState();
}

class _AccountDetailState extends State<AccountDetail> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFf3f4f6),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: BackButton(color: Color(0xFF27282a)),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 5),
                child: TopHeading(
                  heading: "Account Detail",
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
                height: 32,
                decoration: BoxDecoration(
                    color: const Color(0xFFe8ebf0),
                    borderRadius: BorderRadius.circular(10)),
                child: TabBar(
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),
                    tabs: const [
                      Tab(
                        text: "Individual",
                      ),
                      Tab(
                        text: "Business",
                      )
                    ]),
              ),
              Expanded(
                child: TabBarView(children: [
                  Individual(),
                  Business(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
