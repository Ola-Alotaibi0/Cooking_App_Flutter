import 'package:cooking_app/bloc/authBloc/authentication_bloc.dart';
import 'package:cooking_app/bloc/authBloc/authentication_event.dart';
import 'package:cooking_app/bloc/homeBloc/home_bloc.dart';
import 'package:cooking_app/bloc/homeBloc/home_events.dart';
import 'package:cooking_app/bloc/homeBloc/home_states.dart';
import 'package:cooking_app/component/cardColors.dart';
import 'package:cooking_app/component/colors.dart';
import 'package:cooking_app/services/recipes_dataServices.dart';
import 'package:cooking_app/widgets/app_large_text.dart';
import 'package:cooking_app/widgets/app_text.dart';
import 'package:cooking_app/widgets/food_CardInfo.dart';
import 'package:cooking_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageParent extends StatelessWidget {
  AuthenticationBloc authenticationBloc;

  HomePageParent({Key? key, required this.authenticationBloc});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloC(
          data: RecipesDataServices(), authenticationBloc: authenticationBloc)
        ..add(LoadingRecipesEvents()),
      child: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);
    Size size = MediaQuery.of(context).size;
    CardColors cardColors = CardColors();
    return Scaffold(
        backgroundColor: AppColors.colorWhite,
        body: BlocBuilder<HomeBloC, HomeState>(
          builder: (context, state) {
            if (state is LoadingRecipesState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is LoadedRecipesState) {
              var info = state.recipes;
              final int listleng = info.length;
              return Padding(
                padding: const EdgeInsets.only(top: 60, left: 30),
                child: Column(
                  children: [
                    Flexible(
                      flex: 2,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 40),
                            child: Container(
                                child: AppLargeText(
                                    text: "What do you want to cook today?")),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SearchBar(
                            hintText: "Recipe",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppLargeText(
                                  text: "Ppular lunch recipes",
                                  size: 16,
                                ),
                                AppText(
                                  text: "View all",
                                  color: AppColors.textColorGrey,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Flexible(
                      flex: 4,
                      fit: FlexFit.tight,
                      child: Container(
                        height: size.height * 0.8,
                        color: AppColors.colorWhite,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: listleng - 2,
                            itemBuilder: (context, index) {
                              cardColors.getIndex(index);
                              cardColors.getCardColors(index);

                              return GestureDetector(
                                onTap: () {
                                  authenticationBloc.add(
                                      DetailAuthenticationEvent(
                                          recipe: info[index], index: index));
                                },
                                child: FoodCardInfo(
                                  image: info[index].img[index] == null
                                      ? "img null"
                                      : info[index].img[index]!,
                                  foodText: info[index].name == null
                                      ? "name null"
                                      : info[index].name!,
                                  kCal: info[index].kCal.toString() == null
                                      ? "kCal null "
                                      : info[index].kCal!.toString(),
                                  backgroundColor:
                                      cardColors.backgroundCardColors,
                                  textColor: cardColors.textCardColors,
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ));
  }
}
