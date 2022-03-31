import 'package:bloc/bloc.dart';
import 'package:cooking_app/component/colors.dart';
import 'package:cooking_app/cubit/cubit_states.dart';
import 'package:cooking_app/model/recipes_dataModel.dart';
import 'package:cooking_app/services/recipes_dataServices.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class HomeState extends Equatable {}

class InitState extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WelcomeState extends HomeState {
  // welcome Page BloCEvent
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoginState extends HomeState {
  // welcome Page BloCEvent
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class RegistrationState extends HomeState {
  // welcome Page BloCEvent
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadingRecipesState extends HomeState {
  // Home Page BloCEvent
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadedRecipesState extends HomeState {
  // Home Page BloCEvent
  LoadedRecipesState(this.recipes);

  final List<RecipesDataModel> recipes;

  @override
  // TODO: implement props
  List<Object> get props => [recipes];
}

class DetailRecipesState extends HomeState {
  // Detail Page BloCEvent
  DetailRecipesState(this.recipe, this.index);

  final RecipesDataModel recipe;
  final int index;

  @override
  // TODO: implement props
  List<Object> get props => [recipe];
}

class InfoRecipesErrorState extends HomeState {
  InfoRecipesErrorState({required this.errorMessage});

  String errorMessage;

  @override
  // TODO: implement props
  List<Object> get props => [errorMessage];
}

/*
class HomeState { // add for all BloC Pages
  HomeState() : super();


  late final RecipesDataServices data; // Home State Page
  late final recipes; // Home State Page
  Color backgroundCardColors = AppColors.mainColor; // For Home and detaile State Page
  Color textCardColors = AppColors.colorWhite; // For Home and detaile State Page

  void init(RecipesDataServices data) {
    this.data = data;
  }

  void getData() async{ // Home State Page
    try{
      (LoadingState()); // // // emit(LoadingState());
      recipes = await data.getRecipesInfo();// all packge as List RecipesDataModel
      (LoadedState(recipes)); // // // emit(LoadedState(recipes));
    }catch(e){

    }
  }

  void returnHome(){ // Home State Page
    (LoadedState(recipes)); // // // emit(LoadedState(recipes));
  }


  void getCardColors(int index){ // For Home and detaile State Page
    backgroundCardColors = index % 2 == 0 ? AppColors.greyBackgroundColor : AppColors.mainColor;
    textCardColors = index % 2 == 0 ? AppColors.textColorBlack : AppColors.colorWhite;

  }

}
*/
