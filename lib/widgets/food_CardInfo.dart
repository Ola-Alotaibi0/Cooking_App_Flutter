import 'package:cooking_app/component/colors.dart';
import 'package:flutter/material.dart';

import 'app_large_text.dart';
import 'app_text.dart';

class FoodCardInfo extends StatelessWidget {
  FoodCardInfo({
    Key? key,
    required this.image,
    required this.foodText,
    required this.kCal,
    required this.backgroundColor,
    this.textColor = Colors.white,
    //required this.verify_whichCard,
  }) : super(key: key);

  final Color backgroundColor;
  final String image;
  final String foodText;
  final String kCal;
  Color? textColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(right: 15),
      height: size.height * 0.55,
      width: size.width * 0.5,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        overflow: Overflow.clip,
        children: [
          Positioned(
            top: -10,
            left: 20,
            child: Container(
              height: 350,
              width: 350,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 8,
                    blurRadius: 10,
                  ),
                ],
                borderRadius: BorderRadius.circular(200),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            left: 20,
            child: Container(
              width: size.width * 0.4,
              child: AppLargeText(
                text: foodText,
                size: 22,
                color: textColor!,
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 20,
            child: Container(
              width: size.width * 0.4,
              child: AppText(
                text: kCal,
                color: textColor!,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
