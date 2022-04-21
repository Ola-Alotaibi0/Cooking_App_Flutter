import 'package:cooking_app/bloc/homeBloc/home_bloc.dart';
import 'package:cooking_app/bloc/homeBloc/home_states.dart';
import 'package:cooking_app/pages/detail_page.dart';
import 'package:cooking_app/pages/login_page.dart';
import 'package:cooking_app/pages/mainNavPages/main_page.dart';
import 'package:cooking_app/pages/registration_page.dart';
import 'package:cooking_app/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipesProvider extends StatelessWidget {
  const RecipesProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloC, HomeState>(
        builder: (context, state) {
          /*if (state is WelcomeState) {
            return WelcomePage();
          }
          if (state is LoginState) {
            return Center(child: Text(" error "),);//LoginPage();
          }*/
          /*if (state is RegistrationState) {
            return RegistrationPage();
          }*/
          if (state is LoadingRecipesState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
         /* if (state is LoadedRecipesState) {
            return MainPage();
          }*/
          /*if (state is DetailRecipesState) {
            return DetailPage();
          }*/ else {
            return Container();
          }
        },
      ),
    );
  }
}
