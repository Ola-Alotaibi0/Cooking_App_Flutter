//import 'dart:html';

import 'package:cooking_app/bloc/homeBloc/home_bloc.dart';
import 'package:cooking_app/bloc/homeBloc/home_events.dart';
import 'package:cooking_app/bloc/homeBloc/home_states.dart';
import 'package:cooking_app/component/colors.dart';
import 'package:cooking_app/cubit/cubit_states.dart';
import 'package:cooking_app/cubit/cubits.dart';
import 'package:cooking_app/pages/login_page.dart';
import 'package:cooking_app/recipes_provider.dart';
import 'package:cooking_app/services/recipes_dataServices.dart';
import 'package:cooking_app/widgets/app_large_text.dart';
import 'package:cooking_app/widgets/app_text.dart';
import 'package:cooking_app/widgets/button.dart';
import 'package:cooking_app/widgets/slider_dots.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomePage extends StatelessWidget {
   WelcomePage({Key? key}) : super(key: key);

  List images = [
    "welcome_IMG1.PNG",
    "welcome_IMG2.PNG",
    "welcome_IMG3.PNG",
  ];
  List text = [
    {
      'Topic1': "Learn",
      'Topic2': "to cook",
      'Topic3': "Learn to cook easily and quickly with the varieties easily using your phone",
    },
    {
      'Topic1': "Make",
      'Topic2': "delicious food",
      'Topic3':
          "Discover the most delicious new dishes and learn how to prepare them now",
    },
    {
      'Topic1': "Discover",
      'Topic2': "the chef's way",
      'Topic3':
          "You will learn new recipes for chefs, as we offer innovative recipes in the hands of experts",
    }
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //context.read<HomeBloC>().add(FetchRecipesDataEvents());
    //BlocProvider.of<HomeBloC>(context).add(WelcomeEvents());
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: BlocBuilder<HomeBloC, HomeState>(
        builder: (context, state){
          if(state is WelcomeState){
            return Column(
              children: [
                Container(
                  width: size.width,
                  height: size.height * 0.89,
                  child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(
                                    top: 100, left: 20, right: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppLargeText(
                                      text: text[index]['Topic1'],
                                      size: 40,
                                      color: AppColors.colorWhite,
                                    ),
                                    AppLargeText(
                                      text: text[index]['Topic2'],
                                      size: 40,
                                      color: AppColors.colorWhite,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 10),
                                      width: size.width,
                                      child: AppText(
                                        text: text[index]['Topic3'],
                                        color: AppColors.colorWhite.withOpacity(0.8),
                                      ),
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: size.width,
                              height: size.height * 0.5,
                              decoration: BoxDecoration(
                                //color: Colors.yellow,
                                  image: DecorationImage(
                                    image: AssetImage("images/" + images[index]),
                                  )),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SliderDots(
                              index: index,
                            ),
                          ],
                        );
                      }),
                ),
                GestureDetector(
                  onTap: (){
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
                    //BlocProvider.of<HomeBloC>(context).add(LoadingRecipesEvents());
                    BlocProvider.of<HomeBloC>(context).add(LoginEvent());

                  },
                  child: Button(
                    size: size,
                    textButton: "Get started",
                  ),
                ),
              ],
            );
          }else{
            return Container();
          }

        }
      ),
    );
  }
}
