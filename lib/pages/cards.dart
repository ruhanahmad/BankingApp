import 'package:bnacash/Controller/userController.dart';
import 'package:bnacash/card_design.dart';
import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/pages/shared/settings_page.dart';
import 'package:bnacash/widgets/cutom_heading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:bnacash/Controller/userController.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:awesome_card/awesome_card.dart';
class Cards extends StatefulWidget {
  const Cards({Key? key}) : super(key: key);

  @override
  State<Cards> createState() => _CardsState();
}



class _CardsState extends State<Cards> {
    UserController userController = Get.put(UserController());
 

  // @override
  // void initState() {
  //   userController.getVirtualCard();
  //   super.initState();
    
  // }


   Future<void>? alerts(){
    showDialog(context: context, builder: (context){
      return     AlertDialog(
        content: new
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: [
                // Icon(Icons.camera),
                SizedBox(width: 5),
                Text('Enter Address '),
              ],
            ),
            SizedBox(height: 30,),
            TextFormField(
                    
                    onChanged: (value) {
             userController.physicalAddress = value;
                    },
                    decoration: InputDecoration(
               contentPadding:
                   const EdgeInsets.fromLTRB(15.0, 0.0, 10.0, 0.0),
               filled: true,
               fillColor: kPrimaryColor.withOpacity(0.3),
               labelText: 'Enter Address ',
               labelStyle: kFormTextStyle,
               border: InputBorder.none,
               enabledBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(15.0),
                 borderSide: const BorderSide(color: Colors.white),
               ),
               focusedBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(15.0),
                 borderSide: const BorderSide(color: kPrimaryColor),
               )),
                    keyboardType: TextInputType.number,
                    obscureText: false,
            //         validator: (String? value) {
            //  if (value!.length < 6 || value!.length > 6) {
            //    return 'Please Enter only  digits';
            //  }
            //  return null;
            //         },
                  ),

                  GestureDetector(
                    onTap:   () async{

                      
                  await userController.orderPhysicalCard();
                    },
                    child: Container(
                      height: 30,
                      width: 50,
                      decoration: BoxDecoration(color: Colors.blue,),
                      child: Text("Submit"),),
                  )
          ],
        ),
      );
    });
  }

   
  @override
  Widget build(BuildContext context) {
     var users = userController.getVirtualCard();
  // UserController userController = Get.put(UserController());
    return Scaffold(
      backgroundColor: const Color(0xFFf3f4f6),
      body: SingleChildScrollView(
        child: 
       GetBuilder<UserController>(
        
        init: UserController(),
        builder: (_){
            // DateTime date = DateTime.fromMillisecondsSinceEpoch();

        return          Container(
          margin: const EdgeInsets.only(left: 5, right: 10, top: 20),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                // to navigate screen
                GestureDetector(child: const Icon(Icons.arrow_back)),
                Row(
                  children: [
                    GestureDetector(
                      onTap: ()async {
                        
                        await userController.getVirtualCard();
                      },
                      child: const Icon(
                        Icons.swap_vert,
                        size: 26,
                      ),
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
           
            //  userController.isChecked  == false ?

            // userController.virtualCardAcc !=  null ?
            
            userController.virtualCardAcc.length > 0 ?
              Container(child: Column(children: [
              

CreditCard(
    cardNumber: _.virtualCardAcc[0].toString(),
    cardExpiry: _.montht.toString() + " /" + _.yeart.toString(),
    cardHolderName: "",
    cvv: _.virtualCardCvv[0].toString(),
    bankName: "Credit Card",
    // cardType: CardType.masterCard, // Optional if you want to override Card Type
    showBackSide: false,
    frontBackground: CardBackgrounds.black,
    backBackground: CardBackgrounds.white,
    showShadow: true,
    textExpDate: 'Exp. Date',
    textName:"CVV" + " " + _.virtualCardCvv[0].toString(),
    textExpiry: _.virtualCardCvv[0].toString(),
),
                            //
//                     Stack(
//                       children: [
//                         Container(height: 200,width: 500,
//                         decoration: BoxDecoration(color: Colors.yellow,),
//                         child: 

//                         // ListView(
//                         //   children: [
                            
//                         //     // users.map(buildUser).ToList
//                         //   ],
//                         // )
                        
//                         Column(

// children: [

  

//   //  var users =userController.getVirtualCard();
 
//   Text("Account number      " +  _.virtualCardAcc[0].toString()),
//   Text("Cvv        " + _.virtualCardCvv[0].toString() ),
//    Text("Status      " + _.virtualCardStatus[0].toString() ),






// ],
//                         )
//                         ),
//                         // Image.asset('assets/images/bloack-credit-card.png'),
//                         // for visible icon
//                         // const CircleAvatar(
//                         //     radius: 17,
//                         //     backgroundColor: Color(0xFFe8e9ee),
//                         //     child: Icon(
//                         //       Icons.visibility,
//                         //       color: Color(0xFF858c94),
//                         //       size: 19,
//                         //     ))
//                       ],
//                     ),
            //  CarouselSlider(
            //       options: CarouselOptions(
            //         // height: 180.0,
            //         enlargeCenterPage: true,
            //         autoPlay: true,
            //         aspectRatio: 16 / 9,
            //         autoPlayCurve: Curves.fastOutSlowIn,
            //         enableInfiniteScroll: true,
            //         autoPlayAnimationDuration:
            //             const Duration(milliseconds: 800),
            //         viewportFraction: 0.8,
            //       ),
            //       items: [
            //         // don't have real pictures so i use this from internet
        
            //         // Container(
            //         //   child: Image.network('assets/images/index.jpg'),
            //         // ),
            //       ]),

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
                    GestureDetector(
                      onTap: () async{
                        await userController.FreezeCardUpdated();
                      },
                      child:  Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),

                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Color(0xFF0356e0),
                            child: Icon(
                              Icons.ac_unit,
                              color: Colors.white,
                            ),
                          ),
                          
                          title:
                     
                           Text(
                             
                           _.freezeText.toString() ,
                            
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
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
                    ),
                    SizedBox(height: 10,),
                                        ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Color(0xFF0356e0),
                        child: Icon(Icons.settings, color: Colors.white),
                      ),
                      title: const Text(
                        "Order Physical Card",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      subtitle:
                          const Text("Order Card by entering your address "),
                      onTap: () async{

                        await alerts();
                        // Nav.toScreen(context, const SettingsPage());
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              )
              ],
              ),
              ) 
              // :Text("no new data")
           
              
              :Text("Add Card")
 
        
              
            ],
          ),
        );
       })

      
        
     
      ),
    );
  }
}
