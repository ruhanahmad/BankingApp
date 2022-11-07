import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyCustomButton extends StatelessWidget {
  final double width;
  final double height;
  final String label;
  final IconData icon;
  final void Function()? pressed;
  const MyCustomButton({
    Key? key,
    required this.label,
    required this.width,
    required this.height,
    required this.icon,
    required this.pressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0,top: 8.0),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.blueGrey.withOpacity(0.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          fixedSize: Size(width, height),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Icon(icon,size: 20,),
            const SizedBox(width: 5.0),
            Text(
              label,
              style: const TextStyle(
                color: Colors.blue,
              ),
            )
          ],
        ),
        onPressed: pressed,
      ),
    );
  }
}

class MyMaterialButton extends StatelessWidget {
  final IconData icon;
  const MyMaterialButton({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 0,
      child: FaIcon(icon),
      onPressed: (){},
    );
  }
}