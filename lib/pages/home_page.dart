import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/pages/cards.dart';
import 'package:bnacash/pages/home_screens/crypto_screen.dart';
import 'package:bnacash/pages/home_screens/stocks_screen.dart';
import 'package:bnacash/pages/home_screens/vaults_screen.dart';
import 'package:bnacash/pages/whom_to_pay.dart';
import 'package:bnacash/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'home_screens/acoounts_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: scaffoldColor,
        appBar: buildAppBar(context),
        body: const TabBarView(
          children: [
            AccountsScreen(),
            Cards(),
            StocksScreen(),
            CryptoScreen(),
            VaultsScreen(),
          ],
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          foregroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          elevation: 0,
          label: Container(
            // width: size.width * 0.5,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () => Nav.toScreen(context, const HomePage()),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.home,
                      size: 25,
                      color: Colors.blue,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Nav.toScreen(context, WhomToPay()),
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
        ),
      ),
    );
  }
}
