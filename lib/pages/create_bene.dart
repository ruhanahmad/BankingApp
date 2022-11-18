import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/pages/account_detail.dart';
import 'package:bnacash/pages/login/models/dob.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bnacash/widgets/regular_button.dart';
import 'package:bnacash/Controller/userController.dart';
import 'package:get/get.dart';

class CreateBene extends StatefulWidget {
  const CreateBene({Key? key}) : super(key: key);

  @override
  State<CreateBene> createState() => _CreateBeneState();
}

class _CreateBeneState extends State<CreateBene> {
    List<String> _locations = ['A', 'B', 'C', 'D']; // Option 2
  String? _selectedLocation; 
  String? _dropDownValue;

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userController.getAccountData();
  }
  @override
  Widget build(BuildContext context) {
     UserController userController = Get.put(UserController());
    final _formKey = GlobalKey<FormState>();

         return      Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        // title: Text("Reason of Payment"),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body:
      GetBuilder(
        init: UserController(),
        builder: (builder){
          return 
                 Form(
          key: _formKey,
        child: SafeArea(
          child: Padding(
            padding:  EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
           
              Container(
                padding: const EdgeInsets.all(12.0),
                height: 85,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    // FloatingActionButton(
                    //   backgroundColor: Colors.blueGrey.withOpacity(0.2),
                    //   child: const FaIcon(
                    //     FontAwesomeIcons.solidCreditCard,
                    //     color: Colors.blue,
                    //   ),
                    //   elevation: 0,
                    //   onPressed: () {},
                    // ),
                           const SizedBox(
                      width: 12.0,
                    ),
                
              
                
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Create Beneficiary',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          'Create Bank account',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    TextButton(
                      child:  Text(
                        'Change',
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blueGrey.withOpacity(0.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          fixedSize: const Size(80, 5)),
                      onPressed: () {
                         print("object");
                        // Nav.toScreen(context, const MyCard());
                        // Nav.toScreen(context, const BankCard());
                         Nav.toScreen(context, const AccountDetail());
                
                
                        
                      },
                    )
                  ],
                ),
              ),
            
                const Spacer(),
                   TextButton(
              style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
            fixedSize: Size(900, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            )
              ),
              child: Text(
          "Confirm",
          style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold
          ),
              ),
              onPressed: (){
           if (_formKey.currentState!.validate()){

          
           }
           
            // userController.getAccountData();
              },
            ),
                // const MyRegularButton(
                //   label: 'Confirm',
                //   width: 400,
                //   height: 50,
                //   color: Colors.blue,
                //   labelColor: Colors.white,
                
                // ),
                // const SizedBox(
                //   height: 10.0,
                // ),
              ],
            ),
          ),
        ),
      );
        })
      

    );
    
    
    

  }
}
