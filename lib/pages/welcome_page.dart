import 'package:cooking_app/bloc/authBloc/authentication_bloc.dart';
import 'package:cooking_app/bloc/authBloc/authentication_event.dart';
import 'package:cooking_app/component/colors.dart';
import 'package:cooking_app/widgets/app_large_text.dart';
import 'package:cooking_app/widgets/app_text.dart';
import 'package:cooking_app/widgets/slider_dots.dart';
import 'package:cooking_app/widgets/welcome_button.dart';
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

    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Column(
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
                                    top: 60, left: 20, right: 20),
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
                            Flexible(
                              fit: FlexFit.loose,
                              child: Container(
                                width: size.width,
                                height: size.height * 0.5,
                                decoration: BoxDecoration(
                                  //color: Colors.yellow,
                                    image: DecorationImage(
                                      image: AssetImage("images/" + images[index]),
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: SliderDots(
                                index: index,
                              ),
                            ),
                          ],
                        );
                      }),
                ),
                GestureDetector(
                  onTap: (){
                    BlocProvider.of<AuthenticationBloc>(context).add(AppStarted());

                  },
                  child: Button(
                    size: size,
                    textButton: "Get started",
                  ),
                ),
              ],
            )

    );
  }
}
