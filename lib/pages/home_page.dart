import 'package:bnacash/Controller/userController.dart';
import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/models/graph.dart';
import 'package:bnacash/models/graphtry.dart';
import 'package:bnacash/pages/Settings.dart';
import 'package:bnacash/pages/cards.dart';
import 'package:bnacash/pages/home_screens/crypto_screen.dart';
import 'package:bnacash/pages/home_screens/stocks_screen.dart';
import 'package:bnacash/pages/home_screens/vaults_screen.dart';
import 'package:bnacash/pages/login/dialog.dart';
import 'package:bnacash/pages/shared/inbox_page.dart';
import 'package:bnacash/pages/shared/transaction_history.dart';
import 'package:bnacash/pages/verificationFailed.dart';
import 'package:bnacash/pages/whom_to_pay.dart';
import 'package:bnacash/widgets/app_bar.dart';
import 'package:bnacash/widgets/profile_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'home_screens/acoounts_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 late Stream<QuerySnapshot> stream;
UserController userController = Get.put(UserController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userController.getIDo();
var userId = FirebaseAuth.instance.currentUser;
     stream = FirebaseFirestore.instance
        .collection("account").doc(userId!.uid).collection("notifications").snapshots();
        print(stream);
  }


  // @override
  // void initState() {
  //   super.initState();
  //   superVerify();
   
  // }

//   superVerify()async{
// await  userController.verificationChec();
//   }
  @override
  Widget build(BuildContext context) {
    
    UserController userController = UserController();
return
   Scaffold(body: GetBuilder<UserController>(
    init: UserController(),
    builder: (hj){
  return 
  
          
    hj.checkssss == true ?
    DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: scaffoldColor,
        appBar: 
        AppBar(
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.black),
      centerTitle: false,
      elevation: 0,
      title: 
      
       GestureDetector(
        onTap: () async{
         await hj.getDataForProfile(); 
          Get.to(ProfilePage());
        },
        child: CircleAvatar(
          child: Text('RA'),
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.white,
        ),
      ),
      actions: [
        
        StreamBuilder(
         stream: stream,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
            
             if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
 var unreadCount;
            if (snapshot.hasData ) {
            
                unreadCount = snapshot.data!.docs.where((doc) => !doc['read']).length == null ? 0:snapshot.data!.docs.where((doc) => !doc['read']).length;
            
                 
            }
 if (!snapshot.hasData ) {
                //  Get.snackbar("Error", message)
                unreadCount = 0;
            }
       
           

         
            // final unreadCounts = snapshot.data!.docs.where((doc) => !doc['read']).first.id;

              // print(unreadCounts);
              // print(unreadCount);
         return 
         
     
         SizedBox(
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //  MaterialButton(
                //   minWidth: 0,
                //   //color: Colors.transparent,
                //   child: const FaIcon(FontAwesomeIcons.airbnb),
                //   onPressed: () async {
        
                // //  await userController.hanodi();
                //   },
                // ),              
                 MaterialButton(
                  minWidth: 0,
                  //color: Colors.transparent,
                  child: const FaIcon(FontAwesomeIcons.message),
                  onPressed: () async {
                //  await userController.tenNumberGenerated();
                Get.to(DialogFlows());
                
                
                  },
                ),
                MaterialButton(
                  minWidth: 0,
                  //color: Colors.transparent,
                  child: const FaIcon(FontAwesomeIcons.addressBook),
                  onPressed: () async {
                    await hj.getNotification();
                    Nav.toScreen(context,   TransactionHistory());
                    //  await  userController.ification();
                    // await userController.getVirtualCard();
                  },
                ),
                // MaterialButton(
                //   minWidth: 0,
                //   //color: Colors.transparent,
                //   child: const FaIcon(FontAwesomeIcons.solidChartBar),
                //   onPressed: () async {
                //     SharedPreferences prefs =
                //         await SharedPreferences.getInstance();
        
                //     await prefs.remove('LoginInfo');
                //   },
                // ),
                MaterialButton(
                  minWidth: 0,
                  //color: Colors.transparent,
                  child: const FaIcon(FontAwesomeIcons.solidChartBar),
                  onPressed: () async{
                    // Nav.toScreen(context, const AnalyticsPage());
                    await hj.addAllNumbers();
                   // Nav.toScreen(context,  Paga());
                    await hj.graphTry();
                    Get.to(()=>Paga());
                 
                    
                  },
                ),
                //    MaterialButton(
                //   minWidth: 0,
                //   //color: Colors.transparent,
                //   child: const FaIcon(FontAwesomeIcons.carBattery),
                //   onPressed: ()async {
                //      await hj.addAllNumbers();
                //    // Nav.toScreen(context,  Paga());
                //     await hj.graphTry();
                //     // Nav.toScreen(context, const AnalyticsPage());
                //     Nav.toScreen(context,  BarChartSample1());
                //   //  hj.addAllNumbers();
                    
                //   },
                // ),
        
                
                MaterialButton(
                  minWidth: 0,
                  //color: Colors.transparent,
                  child: const FaIcon(FontAwesomeIcons.gear),
                  onPressed: () async {
                    await hj.getDataForProfile();
                    // Nav.toScreen(context, Settingss());
                    Get.to(()=>Settingss());
                    // Get.put(ExampleHomePage());
                  },
                ),
                //         MaterialButton(
                //   minWidth: 0,
                //   //color: Colors.transparent,
                //   child: const FaIcon(FontAwesomeIcons.gear),
                //   onPressed: () async {
                //     // await userController.getDataForProfile();
                //     // Nav.toScreen(context, Settingss());
        
                //     // Get.put(ExampleHomePage());
                //   },
                // ),
                MaterialButton(
                  minWidth: 0,
                  //color: Colors.transparent,
                  child:  unreadCount > 0 ? Container(
  width: 30,
  height: 30,
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
  ),
  child: Image(
    image: AssetImage('assets/yu.png'),
    fit: BoxFit.cover,
  ),
)
:FaIcon(FontAwesomeIcons.solidBell),
                  onPressed: () async {
                    
                    await userController.getNotification();
                     await userController.updateNotify(unreadCount);
                    Nav.toScreen(context, const InboxPage());
                  },
                ),
              ],
            ),
          );
          }
            ),
    
      ],
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
              text: 'Accounts',
            ),
            Tab(
              text: 'Cards',
            ),
            Tab(
              text: 'Exchange',
            ),
            Tab(
              text: 'Crypto',
            ),
            Tab(
              text: 'Agencies',
            ),
          ],
        ),
      ),
    ),
        // buildAppBar(context,stream),
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
    ):VerificationFailed();
   },));
    

  }
}
