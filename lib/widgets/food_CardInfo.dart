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
  }) : super(key: key);

  final Color backgroundColor;
  final String image;
  final String foodText;
  final String kCal;
  Color? textColor;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    var heightCard = size.height * 0.5;
    var widthCard = size.width * 0.4;

    return Container(
      margin: EdgeInsets.only(right: 15),
      width: widthCard,
      height: heightCard,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [

          Positioned(
            top: -30,
            left: 30,
            child: Container(
              height: ((widthCard + heightCard)/100) * 50,
              width: ((widthCard + heightCard)/100) * 50,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                image: DecorationImage(
                  image:  AssetImage(image),
                  fit: BoxFit.cover,
                  ),

                boxShadow: [
                  BoxShadow(
                      color: Colors.black45,
                      blurRadius: 15,
                      offset: Offset(5.0, 5.0),
                  ),
                ],
              ),
            )

          ),
          Positioned(
            bottom: 60,
            left: 20,
            child: Container(
              width: size.width * 0.4,
              child: AppLargeText(
                text: foodText,
                size: ((widthCard + heightCard)/100) * 3,
                color: textColor!,
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 20,
            child: Container(
              width: widthCard * 0.5,
              child: AppText(
                text: kCal,
                size: ((widthCard + heightCard)/100) * 2.5,
                color: textColor!,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
