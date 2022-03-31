import 'package:cooking_app/bloc/homeBloc/home_bloc.dart';
import 'package:cooking_app/bloc/homeBloc/home_events.dart';
import 'package:cooking_app/bloc/homeBloc/home_states.dart';
import 'package:cooking_app/component/colors.dart';
import 'package:cooking_app/cubit/cubit_states.dart';
import 'package:cooking_app/cubit/cubits.dart';
import 'package:cooking_app/widgets/app_large_text.dart';
import 'package:cooking_app/widgets/app_text.dart';
import 'package:cooking_app/widgets/food_CardInfo.dart';
import 'package:cooking_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.colorWhite,
        body: BlocBuilder<HomeBloC, HomeState>(
          builder: (context, state){
            //BlocProvider.of<HomeBloC>(context).emit(LoadedRecipesState(state.))
            if(state is LoadedRecipesState){
              var info = state.recipes;
              var bloC = BlocProvider.of<HomeBloC>(context);
              print("info.info "+ state.recipes[2].name.toString());
              final int listleng = info.length;
              return Padding(
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
                          itemCount: listleng -2,//info.length,//info.length == null ? null : info.length,
                          itemBuilder: (context, index){
                            bloC.getIndex(index);
                            bloC.getCardColors(index);
                            //print("info.2 $info.length");
                            print("list size "+ info.length.toString());
                            //print(" info[index].name** = "+info[index].name == null ? "hi Home" : info[index].name);
                            return GestureDetector(
                              onTap: (){
                                bloC.emit(DetailRecipesState(info[index], index));
                                //bloC.add(DetailRecipesEvents());
                                //getDetailPage(info[index],index);
                              },

                              child: FoodCardInfo(
                                image: info[index].img[index] == null ? "img null": info[index].img[index]!,//foodInfo[index]["image"],
                                foodText: info[index].name == null ? "name null": info[index].name! ,
                                kCal: info[index].kCal.toString() == null ? "kCal null " : info[index].kCal!.toString(),
                                backgroundColor: bloC.backgroundCardColors,
                                textColor: bloC.textCardColors,

                              ),

                            );
                          }
                      ),
                    ),
                  ],
                ),
              );
            }else{
              return Container();
            }
          },
        )
    );
  }
}



