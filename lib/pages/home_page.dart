import 'package:cooking_app/component/colors.dart';
import 'package:cooking_app/cubit/cubits.dart';
import 'package:cooking_app/widgets/app_large_text.dart';
import 'package:cooking_app/widgets/app_text.dart';
import 'package:cooking_app/widgets/food_CardInfo.dart';
import 'package:cooking_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List foodInfo = [
    {
      "image": "images/foodImg/food2.jpg",
      "foodText": "Salmon with couscous",
      "time": "20 min",
    },
    {
      "image": "images/foodImg/food1.jpg",
      "foodText": "Ramen with shrimp",
      "time": "20 min",
    },
    {
      "image": "images/foodImg/food3.jpg",
      "foodText": "Chicken with couscous",
      "time": "20 min",
    },
    {
      "image": "images/foodImg/food4.jpg",
      "foodText": "Meat with shrimp",
      "time": "20 min",
    }

  ];

  @override
  Widget build(BuildContext context) {
    bool verify_whichCard= false;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      body: Padding(
        padding: const EdgeInsets.only(top: 60,left: 30),
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Container(
                  child: AppLargeText(text: "What do you want to cook today?")),
            ),
            SizedBox(height: 30,),
            SearchBar(hintText: "Recipe",),
            SizedBox(height: 30,),

            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppLargeText(text: "Ppular lunch recipes", size: 16,),
                  AppText(text: "View all", color: AppColors.textColorGrey,size: 16,),
                ],
              ),
            ),
            SizedBox(height: 30,),

            Container(
              height: size.height*0.55,
              color: AppColors.colorWhite,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodInfo.length,
                itemBuilder: (context, index){
                return GestureDetector(
                  onTap: (){
                    BlocProvider.of<Cubits>(context).getDetail();
                  },
                  child: FoodCardInfo(
                    image: foodInfo[index]["image"],
                    foodText: foodInfo[index]["foodText"],
                    time: foodInfo[index]["time"],
                    verify_whichCard: verify_whichCard == false ? verify_whichCard = true : verify_whichCard = false,
                  ),
                );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}


