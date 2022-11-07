import 'package:bnacash/pages/constant.dart';
import 'package:bnacash/widgets/custom_textfeild.dart';
import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/country_pickers.dart';
import 'package:country_currency_pickers/currency_picker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

class Individual extends StatefulWidget {
  const Individual({Key? key}) : super(key: key);

  @override
  _IndividualState createState() => _IndividualState();
}

var country = CountryCode();

class _IndividualState extends State<Individual> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf3f4f6),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: const Text(
                        "Country of recipient's bank",
                        style: Constant.inputText,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15, bottom: 5),
                    child: CountryPickerDropdown(
                      initialValue: 'TN',
                      itemBuilder: _buildcountrypciker,
                    ),
                  ),
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: const Text(
                        "Currency",
                        style: Constant.inputText,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 5),
                    child: CurrencyPickerDropdown(
                      initialValue: 'TND',
                      itemBuilder: _buildDefaultMenuItem,
                    ),
                  ),
                ],
              ),
            ),
            const CustonInput(hintText: "TN## #### #### #### #### ####"),
            const CustonInput(hintText: "First and middle names"),
            const CustonInput(hintText: "Last name(s)"),
            const CustonInput(hintText: "E-mail"),
            const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Optional",
                  style: TextStyle(fontSize: 13),
                )),
            Container(
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
            )
          ],
        ),
      ),
    );
  }
}

// for currency dropdown.
Widget _buildDefaultMenuItem(Country country) {
  return SizedBox(
    width: 290,
    child: Row(
      children: <Widget>[
        // CountryPickerUtils.getDefaultFlagImage(country),
        const SizedBox(
          width: 8.0,
        ),
        Text("${country.currencyName}"),
      ],
    ),
  );
}

// for country dropdown
Widget _buildcountrypciker(Country country) {
  return SizedBox(
    width: 290,
    child: Row(
      children: <Widget>[
        // CountryPickerUtils.getDefaultFlagImage(country),

        const SizedBox(
          width: 8.0,
        ),
        Text("${country.name}"),
      ],
    ),
  );
}
