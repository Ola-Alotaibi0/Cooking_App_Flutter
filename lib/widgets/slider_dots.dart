import 'package:cooking_app/component/colors.dart';
import 'package:flutter/material.dart';

class SliderDots extends StatelessWidget {
  int index;
  SliderDots({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(3, (indexSlider) {
          return Container(
            margin: EdgeInsets.only(left: 6),
            height: 8,
            width: index == indexSlider ? 25 : 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: index == indexSlider
                  ? AppColors.colorWhite
                  : AppColors.colorWhite.withOpacity(0.4),
            ),
          );
        })
    );
  }
}