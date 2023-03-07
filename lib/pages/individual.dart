import 'package:bnacash/Controller/userController.dart';
import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/pages/constant.dart';
import 'package:bnacash/widgets/custom_textfeild.dart';
// import 'package:country_currency_pickers/country.dart';
// import 'package:country_currency_pickers/country_pickers.dart';
// import 'package:country_currency_pickers/currency_picker_dropdown.dart';
import 'package:flutter/material.dart';
// import 'package:country_code_picker/country_code_picker.dart';
import 'package:get/get.dart';

import 'hi.dart';

class Individual extends StatefulWidget {
  const Individual({Key? key}) : super(key: key);

  @override
  _IndividualState createState() => _IndividualState();
}

// var country = CountryCode();

class _IndividualState extends State<Individual> {
  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
         final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: const Color(0xFFf3f4f6),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    // Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: Container(
                    //     padding: const EdgeInsets.only(left: 20, top: 10),
                    //     child: const Text(
                    //       "Country of recipient's bank",
                    //       style: Constant.inputText,
                    //     ),
                    //   ),
                    // ),
                    // Container(
                    //   padding: const EdgeInsets.only(left: 15, bottom: 5),
                    //   child: CountryPickerDropdown(
                    //     initialValue: 'TN',
                    //     itemBuilder: _buildcountrypciker,
                    //   ),
                    // ),
                    // Container(
                    //   child: CountryCodePicker(
                    //     initialSelection: 'US',
                    //     showCountryOnly: true,
                    //     showOnlyCountryWhenClosed: true,
                    //     favorite: ['+1', 'US'],
                    //     enabled: true,
                    //     showFlagMain: false,
                    //     alignLeft: true,
                    //   ),
                    // ),
                  ],
                ),
              ),
              // currency Code picker
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    // Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: Container(
                    //     padding: const EdgeInsets.only(left: 20, top: 10),
                    //     child: const Text(
                    //       "Currency",
                    //       style: Constant.inputText,
                    //     ),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 15, bottom: 5),
                    //   child: CurrencyPickerDropdown(
                    //     initialValue: 'TND',
                    //     itemBuilder: _buildDefaultMenuItem,
                    //   ),
                    // ),
                  ],
                ),
              ),
                  Container(
              margin: const EdgeInsets.symmetric(
          vertical: 8.0,
              ),
              decoration: BoxDecoration(
          color: const Color(0xFFffffff),
          borderRadius: BorderRadius.circular(12.0),
              ),
              child: TextFormField(
               onChanged:  (value){
            userController.beneIban  =   value;
          },
                                validator: (value) {
                  if (value!.isEmpty || value!.length < 24 || value!.length > 24 ) {
                   return "Value must not be null or greater/smaller than 24 ";
                  }
                 
                  },
            decoration: InputDecoration(
                hintText: "TN## #### #### #### #### ####",
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10)),
            style: Constant.hintText),
            ),               
             Container(
              margin: const EdgeInsets.symmetric(
          vertical: 8.0,
              ),
              decoration: BoxDecoration(
          color: const Color(0xFFffffff),
          borderRadius: BorderRadius.circular(12.0),
              ),
              child: TextFormField(
          onChanged:  (value){
            userController.beneName  =   value;
          },
           validator: (value) {
                  if (value!.isEmpty  ) {
                   return "Value must not be null ";
                  }
                 
                  },
          // controller: userController.beneName,
            decoration: InputDecoration(
                hintText: "First and middle names",
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10)),
            style: Constant.hintText),
            ),
         
        
               Container(
              margin: const EdgeInsets.symmetric(
          vertical: 8.0,
              ),
              decoration: BoxDecoration(
          color: const Color(0xFFffffff),
          borderRadius: BorderRadius.circular(12.0),
              ),
              child: TextFormField(
               onChanged:  (value){
            userController.beneEmail  =   value;
          },
             validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please Enter a valid Email';
                      }
                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return "Please enter a valid email address";
                    }
                    },
          // controller: userController.beneEmail,
            decoration: InputDecoration(
                hintText: "Email",
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10)),
            style: Constant.hintText),
            ),
            
            
            
          
              
            
              
              const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Optional",
                    style: TextStyle(fontSize: 13),
                  )),
              GestureDetector(
                onTap: () {
                     if (_formKey.currentState!.validate()) {
                   Nav.toScreen(context, ExampleHomePage(iban:"iban",check: true,));
                  }
                   
                  // userController.accIbanCheck();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.blue,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: const Center(
                    child: Text(
                      "Add beneficiary",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// for currency dropdown.
// Widget _buildDefaultMenuItem(Country country) {
//   return SizedBox(
//     width: 290,
//     child: Row(
//       children: <Widget>[
//         // CountryPickerUtils.getDefaultFlagImage(country),
//         const SizedBox(
//           width: 8.0,
//         ),
//         Text("${country.currencyName}"),
//       ],
//     ),
//   );
// }

// for country dropdown
// Widget _buildcountrypciker(Country country) {
//   return SizedBox(
//     width: 290,
//     child: Row(
//       children: <Widget>[
//         // CountryPickerUtils.getDefaultFlagImage(country),

//         const SizedBox(
//           width: 8.0,
//         ),
//         Text("${country.name}"),
//       ],
//     ),
//   );
// }
