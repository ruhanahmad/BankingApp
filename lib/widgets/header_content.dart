import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'custom_button.dart';

class HeaderContent extends StatelessWidget {
  const HeaderContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          child: Text('RA'),
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.white,
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            MyMaterialButton(
              icon: FontAwesomeIcons.solidChartBar,
            ),
            MyMaterialButton(
              icon: FontAwesomeIcons.solidStar,
            ),
            MyMaterialButton(
              icon: FontAwesomeIcons.solidBell,
            ),
          ],
        )
      ],
    );
  }
}
