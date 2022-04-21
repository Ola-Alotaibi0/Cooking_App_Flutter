import 'package:cooking_app/component/colors.dart';
import 'package:cooking_app/widgets/app_text.dart';
import 'package:flutter/material.dart';

class IngredientsInfoCard extends StatelessWidget {
  const IngredientsInfoCard({
    Key? key,
    required this.contentSize_WhiteContainer,
    required this.image,
    required this.ingredientName,
    required this.ingredientQuantity,
  }) : super(key: key);

  final contentSize_WhiteContainer;
  final String image;
  final String ingredientName;
  final String ingredientQuantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: contentSize_WhiteContainer * 7,
                width: contentSize_WhiteContainer * 7,
                decoration: BoxDecoration(
                    color: AppColors.greyBackgroundColor,
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(
                width: 16,
              ),
              AppText(
                text: ingredientName,
                color: AppColors.textColorBlack,
                size: contentSize_WhiteContainer * 2,
              ),
            ],
          ),
          AppText(
            text: ingredientQuantity,
            color: AppColors.textColorGrey,
            size: contentSize_WhiteContainer * 2,
          ),
        ],
      ),
    );
  }
}
