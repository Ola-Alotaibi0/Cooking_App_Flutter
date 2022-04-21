import 'package:cooking_app/model/recipes_dataModel.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {}

class InitState extends HomeState {
  @override
  List<Object?> get props => [];
}

class LoadingRecipesState extends HomeState {
  @override
  List<Object> get props => [];
}

class LoadedRecipesState extends HomeState {
  LoadedRecipesState(this.recipes);

  final List<RecipesDataModel> recipes;

  @override
  List<Object> get props => [recipes];
}

class InfoRecipesErrorState extends HomeState {
  InfoRecipesErrorState({required this.errorMessage});

  String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
