import 'package:cooking_app/component/colors.dart';
import 'package:flutter/material.dart';

class CardColors {

  int index = 0;
  Color backgroundCardColors = AppColors.mainColor;
  Color textCardColors = AppColors.colorWhite;


  void getCardColors(int index) {
    backgroundCardColors =
    index % 2 == 0 ? AppColors.greyBackgroundColor : AppColors.mainColor;
    textCardColors =
    index % 2 == 0 ? AppColors.textColorBlack : AppColors.colorWhite;
  }

  void getIndex(int index) {
    this.index = index;
  }
}