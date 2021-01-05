import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class ButtomNavItem extends StatelessWidget {
  final String svgSrc;
  final String title;
  final Function press;
  final bool isActive;
  const ButtomNavItem({
    this.svgSrc,
    this.title,
    this.press,
    this.isActive = false,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SvgPicture.asset(svgSrc, color: isActive ? kActiveIconColor: kTextColor),
          Text(
              title,
              style: TextStyle(
                  color: isActive ? kActiveIconColor : kTextColor
              )
          )
        ],
      ),
    );
  }
}