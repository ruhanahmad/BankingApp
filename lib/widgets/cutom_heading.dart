import 'package:bnacash/pages/constant.dart';
import 'package:flutter/material.dart';

class TopHeading extends StatelessWidget {
  final String heading;
  const TopHeading({Key? key, required this.heading}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 7),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          heading,
          style: Constant.boldHeading,
        ),
      ),
    );
  }
}
