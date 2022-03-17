import 'package:cooking_app/component/colors.dart';
import 'package:cooking_app/widgets/app_large_text.dart';
import 'package:cooking_app/widgets/app_text.dart';
import 'package:cooking_app/widgets/ingredients_InfoCard.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    List ingredientsData = [
      {
        "image": "images/foodImg/noodle.jpg",
        "ingredientName": "Ramen noodles",
        "ingredientQuantity": "400 g",
      },
      {
        "image": "images/foodImg/Egg.jpg",
        "ingredientName": "Egg",
        "ingredientQuantity": "1",
      },
      {
        "image": "images/foodImg/chicken.jpg",
        "ingredientName": "Chicken",
        "ingredientQuantity": "200 g",
      },
      {
        "image": "images/foodImg/meat.jpg",
        "ingredientName": "Meat",
        "ingredientQuantity": "100 g",
      }

    ];

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [

            Container(
              width: size.width,
              height: size.height*0.7,
              color: AppColors.mainColor,
            ),

            Positioned(
              top: 60,
              left: 30,
              right: 30,
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
                    image: AssetImage("images/foodImg/food1.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            Positioned(
              top: 50,
              right: 20,
              left: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_rounded, color: AppColors.colorWhite,size: 30,)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_outline_sharp, color: AppColors.colorWhite, size: 30,)),
                ],
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(top: 30,right: 20,left: 20),
                width: size.width,
                height: size.height*0.52,
                decoration: BoxDecoration(
                  color: AppColors.colorWhite,
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(70),
                  topRight: Radius.circular(70),
                )),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Icon(Icons.child_care, color: AppColors.mainColor,),
                              SizedBox(height: 5,),
                              AppLargeText(text: "Easy",color: AppColors.textColorBlack,size: 16,),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.access_time_sharp, color: AppColors.mainColor,),
                              SizedBox(height: 5,),
                              AppLargeText(text: "20 min", color: AppColors.textColorBlack,size: 16,),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.star_border, color: AppColors.mainColor,),
                              SizedBox(height: 5,),
                              AppLargeText(text: "4,8", color: AppColors.textColorBlack,size: 16,),
                            ],
                          ),



                        ],
                      ),
                    ),
                    SizedBox(height: 30,),

                    AppLargeText(text: "Ramen with shrimps",),
                    SizedBox(height: 6,),

                    AppText(text: "Classic Japanese recipe",size: 18,color: Colors.black,),
                    SizedBox(height: 30,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppLargeText(text: "Ingredients", size: 18,),
                            SizedBox(height: 6,),
                            AppText(text: "How many servings?", size: 18, color: AppColors.textColorGrey,),
                          ],
                        ),
                        Container(
                          height: size.height*0.06,
                          width: size.width*0.3,

                          decoration: BoxDecoration(
                            color: AppColors.greyBackgroundColor,
                            borderRadius: BorderRadius.circular(40),
                          ),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(onPressed: (){}, icon: Icon(Icons.remove)),
                              AppLargeText(text: "1", color: AppColors.textColorBlack, size: 18,),
                              IconButton(onPressed: (){}, icon: Icon(Icons.add))
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),

                    Container(
                      width: size.width,
                      height: size.height*0.2,
                      child: ListView.builder(
                        padding: EdgeInsets.only(top: 0),
                        itemCount: 4,
                          itemBuilder: (_,index){
                            return IngredientsInfoCard(
                              image: ingredientsData[index]["image"],
                              ingredientName: ingredientsData[index]["ingredientName"],
                              ingredientQuantity: ingredientsData[index]["ingredientQuantity"],
                            );
                          }

                      ),
                    ),
                    //IngredientsInfo(),
                  ],
                ),
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}

