import 'package:cooking_app/component/colors.dart';
import 'package:cooking_app/widgets/app_text.dart';
import 'package:flutter/material.dart';

class IngredientsInfoCard extends StatelessWidget {
  const IngredientsInfoCard({
    Key? key,
    required this.image,
    required this.ingredientName,
    required this.ingredientQuantity,
  }) : super(key: key);

  final String image;
  final String ingredientName;
  final String ingredientQuantity;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Row(
            children: [
              Container(
                height: size.width*0.15,
                width: size.width*0.15,

                decoration: BoxDecoration(
                    color: AppColors.greyBackgroundColor,
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    )
                ),
              ),
              SizedBox(width: 16,),
              AppText(text: ingredientName, color: AppColors.textColorBlack,size: 18,),
            ],
          ),
          AppText(text: ingredientQuantity, color: AppColors.textColorGrey,size: 18,),
        ],
      ),
    );
  }
}