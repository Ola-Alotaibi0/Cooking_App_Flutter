import 'package:cooking_app/bloc/DetailRecipesBloc/detail_bloc.dart';
import 'package:cooking_app/bloc/DetailRecipesBloc/detail_events.dart';
import 'package:cooking_app/bloc/DetailRecipesBloc/detail_states.dart';
import 'package:cooking_app/bloc/authBloc/authentication_bloc.dart';
import 'package:cooking_app/bloc/authBloc/authentication_event.dart';
import 'package:cooking_app/component/cardColors.dart';
import 'package:cooking_app/component/colors.dart';
import 'package:cooking_app/model/recipes_dataModel.dart';
import 'package:cooking_app/widgets/app_large_text.dart';
import 'package:cooking_app/widgets/app_text.dart';
import 'package:cooking_app/widgets/ingredients_InfoCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPageParent extends StatelessWidget {
  final RecipesDataModel recipe;
  final int index;
  AuthenticationBloc authenticationBloc;

  DetailPageParent(
      {Key? key,
      required this.authenticationBloc,
      required this.recipe,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DetailRecipesBloC(authenticationBloc: authenticationBloc)
            ..add(DetailInfoEvents(recipe: recipe, index: index)),
      child: DetailPage(authenticationBloc: authenticationBloc,),);

  }

}
class DetailPage extends StatelessWidget {
  AuthenticationBloc authenticationBloc;
  DetailPage({Key? key, required this.authenticationBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width ;
    var heightWhiteContainer = size.height * 0.6;
    var contentSize_WhiteContainer = ((width + heightWhiteContainer)/100);
    CardColors cardColors = CardColors();

    final AuthenticationBloc authenticationBloc =
    BlocProvider.of<AuthenticationBloc>(context);
    return BlocBuilder<DetailRecipesBloC, DetailInfoRecipesState>(

      builder: (context, state){

        if(state is DetailInfoState){
          DetailInfoState detail = state as DetailInfoState;
          cardColors.getCardColors(detail.index);
          return Scaffold(
            backgroundColor: cardColors.backgroundCardColors,

            body: Container(
              height: size.height,
              width: size.width,

              child: Stack(
                children: [

                  Positioned(
                    top: 30,
                    left: 43,
                    right: 43,
                    child:  Container(
                      height: ((width + height)/100) * 24,
                      width: ((width + height)/100) * 24,

                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        image: DecorationImage(
                          image:  AssetImage(detail.recipe.img![detail.index],),
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
                    top: 40,
                    right: 20,
                    left: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(onPressed: (){
                          authenticationBloc.add(ReturnFromDetailToHomeEvent());
                        },
                            icon: Icon(Icons.arrow_back_rounded, color: cardColors.textCardColors,size: 30,)),
                        IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_outline_sharp, color: cardColors.textCardColors, size: 30,)),
                      ],
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    top: height*0.47,
                    child: Container(
                      padding: EdgeInsets.only(top: 30,right: 20,left: 20),
                      width: size.width,
                      height: heightWhiteContainer,
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
                                    Icon(Icons.child_care, color: AppColors.mainColor,size: contentSize_WhiteContainer * 3),
                                    SizedBox(height: 5,),
                                    AppLargeText(text: "Easy",color: AppColors.textColorBlack,size: contentSize_WhiteContainer * 2),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(Icons.access_time_sharp, color: AppColors.mainColor,size: contentSize_WhiteContainer * 3),
                                    SizedBox(height: 5,),
                                    AppLargeText(text: "20 min", color: AppColors.textColorBlack,size: contentSize_WhiteContainer * 2),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(Icons.star_border, color: AppColors.mainColor,size: contentSize_WhiteContainer * 3,),
                                    SizedBox(height: 5,),
                                    AppLargeText(text: "4,8", color: AppColors.textColorBlack,size: contentSize_WhiteContainer * 2,),
                                  ],
                                ),



                              ],
                            ),
                          ),
                          SizedBox(height: 25,),

                          AppLargeText(text: detail.recipe.name == null ? "hi detail" : detail.recipe.name!,
                          size: contentSize_WhiteContainer * 4,),
                          SizedBox(height: 6,),

                          AppText(text: detail.recipe.description!,size: contentSize_WhiteContainer * 2,color: Colors.black,),
                          SizedBox(height: 30,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppLargeText(text: "Ingredients", size: contentSize_WhiteContainer * 2,),
                                  SizedBox(height: 6,),
                                  AppText(text: "How many servings?", size: contentSize_WhiteContainer * 2, color: AppColors.textColorGrey,),
                                ],
                              ),
                              Container(
                                height: contentSize_WhiteContainer * 6,
                                width: size.width*0.27,

                                decoration: BoxDecoration(
                                  color: AppColors.greyBackgroundColor,
                                  borderRadius: BorderRadius.circular(40),
                                ),

                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(onPressed: (){}, icon: Icon(Icons.remove,size: contentSize_WhiteContainer * 2)),
                                    AppLargeText(text: "1", color: AppColors.textColorBlack, size: contentSize_WhiteContainer * 2,),
                                    IconButton(onPressed: (){}, icon: Icon(Icons.add,size: contentSize_WhiteContainer * 2))
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 25,),

                          Flexible(
                            fit: FlexFit.loose,
                            child: Container(
                              width: size.width,
                              height: heightWhiteContainer,
                              child: ListView.builder(
                                  padding: EdgeInsets.only(top: 0),
                                  itemCount: detail.recipe.ingredients!.length,
                                  itemBuilder: (_,index){
                                    return IngredientsInfoCard(
                                      contentSize_WhiteContainer: contentSize_WhiteContainer,
                                      image: detail.recipe.ingredients![index].img[index],
                                      ingredientName: detail.recipe.ingredients![index].name!,
                                      ingredientQuantity: detail.recipe.ingredients![index].quantity!,
                                    );
                                  }

                              ),
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
        }else{
          return Container();
        }

      },
    );

  }
}


