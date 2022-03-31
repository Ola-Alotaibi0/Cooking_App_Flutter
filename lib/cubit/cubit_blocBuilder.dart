import 'package:cooking_app/cubit/cubit_states.dart';
import 'package:cooking_app/cubit/cubits.dart';
import 'package:cooking_app/pages/detail_page.dart';
import 'package:cooking_app/pages/home_page.dart';
import 'package:cooking_app/pages/mainNavPages/main_page.dart';
import 'package:cooking_app/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitBlocBuilder extends StatefulWidget {
  const CubitBlocBuilder({Key? key}) : super(key: key);

  @override
  State<CubitBlocBuilder> createState() => _CubitBlocBuilderState();
}

class _CubitBlocBuilderState extends State<CubitBlocBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder< Cubits, CubitStates >(
          builder: (context, state){
            if(state is WelcomeState1){
              return WelcomePage();
            }if(state is LoadingState){
              return Center(child: CircularProgressIndicator(),);
            }if(state is LoadedState){
              return MainPage();
            }if(state is DetailState){
              return DetailPage();
            }else{
              return Container();
            }
          },
      ),
    );
  }
}
