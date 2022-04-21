import 'package:cooking_app/model/recipes_dataModel.dart';
import 'package:equatable/equatable.dart';

abstract class DetailInfoRecipesEvents extends Equatable {}

class InitialEvents extends DetailInfoRecipesEvents {
  @override
  List<Object> get props => [];
}

class DetailInfoEvents extends DetailInfoRecipesEvents {
  final RecipesDataModel recipe;
  final int index;

  DetailInfoEvents({required this.recipe, required this.index});
  @override
  List<Object> get props => [recipe];
}

