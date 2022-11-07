// ignore_for_file: prefer_const_constructors

import 'package:bnacash/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:bnacash/Respnsive/respnsive.dart';
import 'package:bnacash/pages/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

var controllerEmail = TextEditingController();
var controllerFirstname = TextEditingController();
var controllerLastname = TextEditingController();

class _FirstScreenState extends State<FirstScreen> {
  final _dropdownFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // DefaultTabController    is widget to the TabBar  to toggle between to widget
    return DefaultTabController(
      //  length  of Tab bar
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.grey.shade200,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _dropdownFormKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.only(left: 5, right: 100),
                child: Text(
                  'Account details',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 35,
                // we add width like that to be more responvie  you can find  the widget in *Respnsive file*

                width: displayWidth(context) * .96,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),

                  // here is the Tab bar  you acn add item as you wish and contror in  Shap of the *lable of the Tab bar *
                  child: TabBar(
                      unselectedLabelColor: Colors.grey,
                      labelColor: Colors.black,
                      indicator: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      tabs: const [
                        // first Item OF Tab bar is  * 'Individual'*
                        Text(
                          'Individual',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'jannah',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        //the  second Item OF Tab bar is  * ''Bussiness''*
                        Text(
                          'Bussiness',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'jannah',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                ),
              ),
              SizedBox(
                height: 700,

                // that is the containt of  Tab bar
                child: TabBarView(
                  children: [
                    // that is  the  first containt of Widet
                    Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // / the funcation of  DropdownButtonFormField   we extract it to  DropDownWidget to be a clean code you can find it in side *widget file*
                        DropDownWidget(
                          // can you  add the containt of  DropDownWidget by lable
                          lable: Text("country of recipient's bank"),
                        ),
                        DropDownWidget(
                          lable: Text("currency"),
                        ),
                        DropDownWidget(
                          lable: Text("IBAN:"),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        // / the funcation of  TextFormField    we extract it to  defaultFormField  to be a clean code you can find it in side *widget file*

                        defaultFormField(
                          hintText: 'First name and middle names',
                          labelStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          controller: controllerFirstname,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Enter First name and middle names';
                            }
                            return null;
                          },
                          type: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        // / the funcation of  TextFormField    we extract it to  defaultFormField  to be a clean code you can find it in side *widget file*
                        defaultFormField(
                          hintText: 'Last name(s)',
                          labelStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          controller: controllerLastname,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Last name';
                            }
                            return null;
                          },
                          type: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        // / the funcation of  TextFormField    we extract it to  defaultFormField  to be a clean code you can find it in side *widget file*
                        defaultFormField(
                          hintText: 'E-mail',
                          labelStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          controller: controllerEmail,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Enter E-mail';
                            }
                            return null;
                          },
                          type: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          // we add width like that to be more responvie  you can find  the widget in *Respnsive file*
                          width: displayWidth(context) * .9,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0XFF4C68DA),
                              padding: EdgeInsets.only(
                                  top: 15, bottom: 20, left: 110, right: 110),
                              elevation: 6,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Text(
                              'Add benenficiary',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              if (_dropdownFormKey.currentState!.validate()) {}
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Secondscreen()));
                            },
                          ),
                        ),
                      ],
                    ),

                    // / that is  the  second containt of Widet
                    Container(
                      height: 500,
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          'HELLO',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
