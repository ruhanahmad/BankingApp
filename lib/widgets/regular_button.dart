import 'package:flutter/material.dart';


class MyRegularButton extends StatelessWidget {
  final Color color, labelColor;
  final String label;
  final double width, height;
  const MyRegularButton({
    Key? key,
    required this.color,
    required this.labelColor,
    required this.label,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          backgroundColor: color,
          fixedSize: Size(width, height),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          )
      ),
      child: Text(
        label,
        style: TextStyle(
            color: labelColor,
            fontSize: 15,
            fontWeight: FontWeight.bold
        ),
      ),
      onPressed: (){},
    );
  }
}
