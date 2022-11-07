import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/pages/home_page.dart';
import 'package:flutter/material.dart';

class TransfersPage extends StatefulWidget {
  const TransfersPage({Key? key}) : super(key: key);

  @override
  _TransfersPageState createState() => _TransfersPageState();
}

class _TransfersPageState extends State<TransfersPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(
            color: kPrimaryColor,
          ),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Settings",
                style: kAppBarTextStyle.copyWith(fontSize: 25),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: size.width * 0.5,
                height: 40,
                child: TabBar(
                  labelPadding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 5.0),
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: kPrimaryColor.withOpacity(0.5),
                  ),
                  tabs: const [
                    Tab(
                      text: 'Transfers',
                    ),
                    Tab(
                      text: 'Scheduled',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: size.height * 0.4,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: kPrimaryColor.withOpacity(0.7),
                          offset: const Offset(5, 5),
                          blurRadius: 10,
                        ),
                      ],
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/world.png")),
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        // height: 50,
                        padding: const EdgeInsets.all(5.0),
                        decoration: const BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15.0),
                                bottomRight: Radius.circular(15.0))),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Pay and get paid, hassle-free",
                                style: kAppBarTextStyle.copyWith(
                                    fontSize: 25, color: Colors.white),
                              ),
                            ),
                            const Divider(),
                            Center(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        "Pay and get paid in an instant, trannsfer money abroad, or split bills",
                                        style: kContentTextStyle.copyWith(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8.0, horizontal: 4.0),
                                          child: Text(
                                            "Change",
                                            style: kContentTextStyle,
                                          ),
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.2,
              ),
              Center(
                child: Container(
                  // width: size.width * 0.5,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: kPrimaryColor.withOpacity(0.7),
                          offset: const Offset(5, 5),
                          blurRadius: 10,
                        )
                      ],
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/images/visa.png",
                          height: 35,
                        ),
                      ),
                      InkWell(
                        onTap: () => Nav.toScreen(context, const HomePage()),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.sync_alt_rounded,
                            size: 25,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => Nav.toScreen(context, const HomePage()),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.space_dashboard_rounded,
                            size: 25,
                            color: Colors.blue,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
