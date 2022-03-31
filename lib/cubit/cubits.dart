import 'package:bloc/bloc.dart';
import 'package:cooking_app/component/colors.dart';
import 'package:cooking_app/cubit/cubit_states.dart';
import 'package:cooking_app/model/recipes_dataModel.dart';
import 'package:cooking_app/services/recipes_dataServices.dart';
import 'package:flutter/material.dart';

class Cubits extends Cubit<CubitStates>{ // add for all BloC Pages
  Cubits({required this.data}) : super(InitialState()){ // add for all BloC Pages
    emit(WelcomeState1()); // add for all BloC Pages
  }

  final RecipesDataServices data; // Home State Page
  late final recipes; // Home State Page
  Color backgroundCardColors = AppColors.mainColor; // For Home and detaile State Page
  Color textCardColors = AppColors.colorWhite; // For Home and detaile State Page

  void getData() async{ // Home State Page
    try{
      emit(LoadingState());
      recipes = await data.getRecipesInfo();// all packge as List RecipesDataModel
      emit(LoadedState(recipes));
    }catch(e){

    }
  }

  void getDetailPage(RecipesDataModel data, int index){ // Detail State Page
    emit(DetailState(data, index));
  }

  void returnHome(){ // Home State Page
    emit(LoadedState(recipes));
  }


  void getCardColors(int index){ // For Home and detaile State Page
    backgroundCardColors = index % 2 == 0 ? AppColors.greyBackgroundColor : AppColors.mainColor;
    textCardColors = index % 2 == 0 ? AppColors.textColorBlack : AppColors.colorWhite;

  }

}