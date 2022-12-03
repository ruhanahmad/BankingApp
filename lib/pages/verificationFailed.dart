

import 'package:bnacash/main.dart';
import 'package:flutter/material.dart';



class VerificationFailed extends StatefulWidget {
  const VerificationFailed({Key? key}) : super(key: key);

  @override
  State<VerificationFailed> createState() => _VerificationFailedState();
}

class _VerificationFailedState extends State<VerificationFailed> {
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