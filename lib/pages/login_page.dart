import 'package:cooking_app/bloc/homeBloc/home_bloc.dart';
import 'package:cooking_app/bloc/homeBloc/home_events.dart';
import 'package:cooking_app/bloc/homeBloc/home_states.dart';
import 'package:cooking_app/component/colors.dart';
import 'package:cooking_app/pages/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<HomeBloC, HomeState>(
        builder: (context, state){
      if(state is LoginState){
        return Container(
          height: size.height,
          width: size.width,
          color: AppColors.colorWhite,
          child: Stack(
            children: [

              Positioned(
                right: size.height* 0.03,
                top: size.height* 0.07,
                child: Container(
                  height: size.height * 0.9,
                  width: size.height *0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size.height *0.5),
                      color: AppColors.greyBackgroundColor,
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.textColorBlack.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 10,
                            blurStyle: BlurStyle.outer
                        ),]
                  ),
                ),
              ),

              Container(
                height: size.height,
                //width: size.width,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 40,),
                        Container(
                          height: size.height*0.3,
                          //flex: 3,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Welcome\nBack",
                              style: TextStyle(
                                  color: AppColors.mainColor,
                                  fontSize: 44,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        //SizedBox(height: 10,),
                        Container(
                          height: size.height*0.6,
                          //flex: 6,
                          child: ListView(
                            children: [
                              TextField(

                                keyboardType: TextInputType.emailAddress,
                                //obscureText: checkPassword(),

                                style: TextStyle(color: Colors.black),

                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                                  hintText: "Email",
                                  contentPadding: EdgeInsets.all(10),
                                  //fillColor: Colors.black,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.mainColor.withOpacity(0.6), width: 2),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.textButtonColor, width: 2),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              TextField(

                                keyboardType: TextInputType.visiblePassword,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                                  hintText: "Password",
                                  contentPadding: EdgeInsets.all(10),
                                  //fillColor: Colors.black,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.mainColor.withOpacity(0.6), width: 2),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.textButtonColor, width: 2),
                                  ),
                                ),
                              ),
                              SizedBox(height: 100),
                              //SizedBox(height: cDefaultPadding * 2),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Sign in",
                                    style: TextStyle(
                                        color: AppColors.mainColor,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  ElevatedButton(

                                    onPressed: (){
                                      BlocProvider.of<HomeBloC>(context).add(LoadingRecipesEvents());
                                    },

                                    child: Icon(FontAwesomeIcons.longArrowAltRight, color: AppColors.colorWhite),
                                    style: ElevatedButton.styleFrom(
                                      shape: CircleBorder(),
                                      padding: EdgeInsets.all(20),
                                      primary: AppColors.mainColor, // <-- Button color
                                      onPrimary: AppColors.textButtonColor, // <-- Splash color
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 50),

                              Align(
                                alignment: Alignment.centerLeft,
                                child: InkWell(
                                  splashColor: Colors.white,
                                  onTap: (){
                                    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegistrationPage()));
                                    BlocProvider.of<HomeBloC>(context).add(RegistrationEvent());
                                  },
                                  child: Text(
                                    'Sign up',
                                    style: TextStyle(
                                      fontSize: 19,
                                      decoration: TextDecoration.underline,
                                      color: AppColors.textButtonColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
        }else {
        return Container();
          }
        }
      ),

    );
  }
}
