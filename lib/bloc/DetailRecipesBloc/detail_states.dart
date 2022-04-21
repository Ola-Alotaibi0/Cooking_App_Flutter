import 'package:cooking_app/model/recipes_dataModel.dart';
import 'package:equatable/equatable.dart';

abstract class DetailInfoRecipesState extends Equatable {}

class InitDetailState extends DetailInfoRecipesState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class DetailInfoState extends DetailInfoRecipesState {
  DetailInfoState({required this.recipe, required this.index});

  final RecipesDataModel recipe;
  final int index;

  @override
  List<Object> get props => [recipe];
}

class RecipesErrorState extends DetailInfoRecipesState {
  RecipesErrorState({required this.errorMessage});

  String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
