import 'package:cooking_app/component/colors.dart';
import 'package:cooking_app/model/recipes_dataModel.dart';
import 'package:cooking_app/services/recipes_dataServices.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class CubitStates extends Equatable{}

class InitialState extends CubitStates{
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class WelcomeState extends CubitStates{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadingState extends CubitStates{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadedState extends CubitStates{
  LoadedState(this.recipes);
  final List<RecipesDataModel> recipes;
  @override
  // TODO: implement props
  List<Object> get props => [recipes];
}

class DetailState extends CubitStates{
  DetailState(this.recipe, this.index);
  final RecipesDataModel recipe;
  final int index;
  @override
  // TODO: implement props
  List<Object> get props => [recipe];
}

/*
class cardColorState extends CubitStates{

  @override
  // TODO: implement props
  List<Object> get props => [];
}*/
