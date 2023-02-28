import 'package:bnacash/Controller/userController.dart';
import 'package:bnacash/pages/home_page.dart';
import 'package:bnacash/widgets/app_bar.dart';
import 'package:bnacash/widgets/transaction_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';


class nkloTwo extends StatefulWidget {
  const nkloTwo({Key? key}) : super(key: key);

  @override
  _nkloTwoState createState() => _nkloTwoState();
}

class _nkloTwoState extends State<nkloTwo> {
  DateTime _selectedDate = DateTime.now();
  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scroll Date Picker Example"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 100.0,
            alignment: Alignment.center,
            child: Text(
              "$_selectedDate",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 48),
            child: TextButton(
              onPressed: () async {
                // setState(() {
                //   _selectedDate = DateTime.now();
                // });
              await userController.yearlyHanodi();
              },
              child: Text(
                "Export PDF",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
          SizedBox(
            height: 250,
            child: ScrollDatePicker(
              selectedDate: _selectedDate,
              locale: Locale('en'),
              onDateTimeChanged: (DateTime value) {
     setState(() {
        _selectedDate = value;
     });
                  userController.selectedDateYear = value;
                  userController.update();
                    
                  print(value);
                
              },
            ),
          ),
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.pop(context);
                  //   },
                  //   child: SizedBox(
                  //             height: 50,
                  //             child:Container(
                  //               height: 40,
                  //               width: 40,
                  //               color: Colors.purple,
                  //               child: Text("Button"),)
                      
                  //           ),
                  // ),

        ],
      ),
    );
  }
}