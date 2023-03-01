import 'package:bnacash/Controller/userController.dart';
import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/models/primary_button.dart';
import 'package:bnacash/pages/login/models/email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
class DobField extends StatefulWidget {
  const DobField({Key? key}) : super(key: key);

  @override
  _DobFieldState createState() => _DobFieldState();
}
  UserController userController = Get.put(UserController());
  

class _DobFieldState extends State<DobField> {
  TextEditingController dateController = TextEditingController();
   @override
  void initState() {
    dateController.text = ""; //set the initial value of text field
    super.initState();
  }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //  body: Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.stretch,
    //       children: [
    //         Text(
    //           "Date of Birth",
    //           style: kAppBarTextStyle.copyWith(fontSize: 25),
    //         ),
    //         const SizedBox(height: 10),
    //         const Text(
    //           "As stated on your official ID. You must atleast 18 years old to open an account",
    //           style: kContentTextStyle,
    //         ),
    //         const SizedBox(height: 20),
    //         Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 8.0),
    //           child: TextFormField(
    //              controller: dateInput,
    //             onChanged: (value) {
    //               userController.dob = value;
    //             },
    //             readOnly: true,
    //             // decoration: InputDecoration(
    //             //     contentPadding:
    //             //         const EdgeInsets.fromLTRB(15.0, 0.0, 10.0, 0.0),
    //             //     filled: true,
    //             //     fillColor: kPrimaryColor.withOpacity(0.3),
    //             //     labelText: 'DD/MM/YYYY',
    //             //     labelStyle: kFormTextStyle,
    //             //     border: InputBorder.none,
    //             //     // prefixIcon: const Icon(Icons.search_rounded),
    //             //     enabledBorder: OutlineInputBorder(
    //             //       borderRadius: BorderRadius.circular(15.0),
    //             //       borderSide: const BorderSide(color: Colors.white),
    //             //     ),
    //             //     focusedBorder: OutlineInputBorder(
    //             //       borderRadius: BorderRadius.circular(15.0),
    //             //       borderSide: const BorderSide(color: kPrimaryColor),
    //             //     )),
    //             keyboardType: TextInputType.text,
    //             obscureText: false,
    //             validator: (String? value) {
    //               if (value!.isEmpty) {
    //                 return 'Please Enter your DOB';
    //               }
    //               return null;
    //             },
                
    //           ),
    //         ),
    //         const SizedBox(height: 20),
    //         const Spacer(),
    //          ElevatedButton
                  
    //             (
                  
    //                                 style: ElevatedButton.styleFrom(
    //                                   padding: const EdgeInsets.symmetric(
    //                                       vertical: 10.0, horizontal: 8.0),
    //                                   elevation: 5.0,
    //                                   primary: kPrimaryColor,
    //                                   shape: RoundedRectangleBorder(
    //                                       borderRadius:
    //                                           BorderRadius.circular(50.0)),
    //                                 ),
    //               onPressed: () async{
    //                                 DateTime? pickedDate = await showDatePicker(
    //                 context: context,
    //                 initialDate: DateTime.now(),
    //                 firstDate: DateTime(1950),
    //                 //DateTime.now() - not to allow to choose before today.
    //                 lastDate: DateTime(2100));
    //                 if (pickedDate != null) {
    //               print(
    //                   pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
    //               String formattedDate =
    //                   DateFormat('yyyy-MM-dd').format(pickedDate);
    //               print(
    //                   formattedDate); //formatted date output using intl package =>  2021-03-16
    //               setState(() {
    //                 dateInput.text =
    //                     formattedDate; //set output date to TextField value.
    //               });
    //             } else {}


    //                  print(userController.dob );
    //                  Get.to(EmailField(),);
    //                 // await userController.uploadData();
    //                }, child: Text("Next"))
    //       ],
    //     ),
    //   ),
    // );
     return Scaffold(
      
      body: SafeArea(
        child: Container(
          height:MediaQuery.of(context).size.height,
            // padding:const EdgeInsets.all(15),
            
            child:Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Date of Birth",style: kAppBarTextStyle.copyWith(fontSize: 25),),
                  Center( 
                     child:TextField(
                      
                        controller: dateController, //editing controller of this TextField
                        decoration: const InputDecoration( 
                        
                           icon: Icon(Icons.calendar_today), //icon of text field
                           labelText: "Enter Date of Birth" //label text of field
                        ),
                        readOnly: true,  // when true user cannot edit text 
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                               initialDate: DateTime.now(), //get today's date
                              firstDate: DateTime(1947), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2023)
                          );
                          
                          if(pickedDate != null ){
                              print(pickedDate);  //get the picked date in the format => 2022-07-04 00:00:00.000
                              String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                              print(formattedDate); //formatted date output using intl package =>  2022-07-04
                                //You can format date as per your need
            
                              setState(() {
                                 dateController.text = formattedDate;
                                 userController.dob = formattedDate;
                                 userController.update(); //set foratted date to TextField value. 
                              });
                          }else{
                              print("Date is not selected");
                          }
                        },
                     )
                  ),
                             const SizedBox(height: 20),
              const Spacer(),
               ElevatedButton
                    
                  (
                    
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 8.0),
                                        elevation: 5.0,
                                        primary: kPrimaryColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0)),
                                      ),
                    onPressed: () async{
                                       if (_formKey.currentState!.validate()) {
              // If the form is valid, display a snackbar. In the real world,
              // you'd often call a server or save the information in a database.
          //     ScaffoldMessenger.of(context).showSnackBar(
          // const SnackBar(content: Text('Processing Data')),
          
          //     );
                 Get.to(EmailField(),);
            }
      
      
                       print(userController.dob );
                     
                      // await userController.uploadData();
                     }, child: Text("Next"))
                ],
              ),
            )
          ),
      ));
  }
}
