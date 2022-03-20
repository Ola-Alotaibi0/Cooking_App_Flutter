import 'package:cooking_app/component/colors.dart';
import 'package:flutter/material.dart';

import 'app_large_text.dart';
import 'app_text.dart';

class FoodCardInfo extends StatelessWidget {
  FoodCardInfo({
    Key? key,
    required this.image,
    required this.foodText,
    required this.time,
    required this.verify_whichCard,
  }) : super(key: key);

  final String image;
  final String foodText;
  final String time;
  final bool verify_whichCard;
  Color? textColor;
  Color? backgroundColor;

  void check(){
    if(verify_whichCard){
      print(verify_whichCard);
      textColor = AppColors.textColorBlack;
      backgroundColor = AppColors.greyBackgroundColor;
    } else {
      print(verify_whichCard);
      textColor = AppColors.colorWhite;
      backgroundColor = AppColors.mainColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    check();
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(right: 15),
      height: size.height*0.55,
      width: size.width*0.5,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        overflow: Overflow.clip,
        /*fit: StackFit.loose,
        clipBehavior: Clip.hardEdge,*/
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

              child: AppLargeText(text: foodText,size: 22,color: textColor!,),
            ),
          ),

          Positioned(
            bottom: 30,
            left: 20,
            child: Container(
              width: size.width * 0.4,
              child: AppText(text: time,color: textColor!,),
            ),
          ),

        ],
      ),

    );
  }
}