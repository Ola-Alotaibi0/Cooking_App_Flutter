import 'package:bloc/bloc.dart';
import 'package:cooking_app/component/colors.dart';
import 'package:cooking_app/cubit/cubit_states.dart';
import 'package:cooking_app/model/recipes_dataModel.dart';
import 'package:cooking_app/services/recipes_dataServices.dart';
import 'package:flutter/material.dart';

class Cubits extends Cubit<CubitStates>{
  Cubits({required this.data}) : super(InitialState()){
    emit(WelcomeState());
  }

  final RecipesDataServices data;
  late final recipes;
  Color backgroundCardColors = AppColors.mainColor;
  Color textCardColors = AppColors.colorWhite;

  void getData() async{
    try{
      emit(LoadingState());
      recipes = await data.getRecipesInfo();// all packge as List RecipesDataModel
      emit(LoadedState(recipes));
    }catch(e){

    }
  }

  void getDetailPage(RecipesDataModel data, int index){
    emit(DetailState(data, index));
  }

  void returnHome(){
    emit(LoadedState(recipes));
  }


  void getCardColors(int index){
    backgroundCardColors = index % 2 == 0 ? AppColors.greyBackgroundColor : AppColors.mainColor;
    textCardColors = index % 2 == 0 ? AppColors.textColorBlack : AppColors.colorWhite;

  }

}