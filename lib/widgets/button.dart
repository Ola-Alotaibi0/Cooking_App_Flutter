import 'package:cooking_app/component/colors.dart';
import 'package:cooking_app/widgets/app_large_text.dart';
import 'package:cooking_app/widgets/app_text.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Size size;
  final String textButton;
  double? width;
  double? height;
  Color? buttonBackgroundColor;
  Color? buttonTextColor;
  Button({
    Key? key,
    required this.size,
    required this.textButton,
    this.width ,
    this.height ,
    this.buttonBackgroundColor,
    this.buttonTextColor ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: size.width*0.87,
        height: size.height *0.08,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: buttonBackgroundColor == null ? AppColors.colorWhite : buttonBackgroundColor!,
        ),
        child: Center(
            child: AppLargeText(
          text: textButton,
          size: 20,
          color: buttonTextColor == null ? AppColors.textButtonColor : buttonTextColor!,
        )),
      ),
    );
  }
}
