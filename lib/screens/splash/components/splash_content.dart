import 'package:flutter/material.dart';
import 'package:project_flutter/constants.dart';
import 'package:project_flutter/size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    this.title,
    this.image,
    this.text,
  }) : super(key: key);
  final String? title, text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Spacer(flex: 1),
        Image.asset(
          image!,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        ),
        SizedBox(height: 30),
        Text(
          title!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(16),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 30),
        Text(
          text!,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
