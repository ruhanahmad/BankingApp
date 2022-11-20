import 'package:bnacash/pages/constant.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  const CustomBtn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          text,
          style: Constant.btnText,
        ),
        style: ElevatedButton.styleFrom(
          onPrimary: const Color(0xFF335ebd),
          primary: const Color(0xFFe8f1fa),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
