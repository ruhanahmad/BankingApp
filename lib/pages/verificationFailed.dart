

import 'package:bnacash/main.dart';
import 'package:flutter/material.dart';



class VerificationFailed extends StatelessWidget {
  const VerificationFailed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verification Feild"),
        
      ),
      
      body: Center(child: Container(
      child: Text("It need to be verified first"),
    )));
  }
}