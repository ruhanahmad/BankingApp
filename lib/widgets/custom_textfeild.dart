import 'package:bnacash/pages/constant.dart';
import 'package:flutter/material.dart';

class CustonInput extends StatelessWidget {
  final String hintText;

  const CustonInput({Key? key, 
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFffffff),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: TextField(
          decoration: InputDecoration(
              hintText: hintText,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10)),
          style: Constant.hintText),
    );
  }
}
