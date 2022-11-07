import 'package:bnacash/constants/constants.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key, this.text, this.onPressed, this.color})
      : super(key: key);
  final String? text;
  final VoidCallback? onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: color ?? kPrimaryColor.withOpacity(0.9),
        ),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0.0,
              primary: Colors.transparent,
            ),
            child: Text(text!,
                style: const TextStyle(
                    color: kBackgroundColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600)),
            onPressed: onPressed),
      ),
    );
  }
}
