import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BoxModel extends StatefulWidget {
  final Color color;
  final String imagePath, description;
  final void Function()? pressed;
  const BoxModel(
      {Key? key,
        required this.color,
        required this.imagePath,
        required this.description,
        required this.pressed,
      })
      : super(key: key);

  @override
  State<BoxModel> createState() => _BoxModelState();
}

class _BoxModelState extends State<BoxModel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: widget.color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(icon: const FaIcon(FontAwesomeIcons.windowClose,color: Colors.white,),onPressed: widget.pressed,),
          Image.asset(widget.imagePath),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
                widget.description,
              textAlign: TextAlign.left,
              style: const TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
