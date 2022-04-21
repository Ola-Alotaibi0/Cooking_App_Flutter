import 'package:cooking_app/bloc/DetailRecipesBloc/detail_events.dart';
import 'package:cooking_app/bloc/DetailRecipesBloc/detail_states.dart';
import 'package:cooking_app/bloc/authBloc/authentication_bloc.dart';
import 'package:cooking_app/services/recipes_dataServices.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailRecipesBloC extends Bloc<DetailInfoRecipesEvents, DetailInfoRecipesState> {
  final AuthenticationBloc authenticationBloc;
  DetailRecipesBloC({required this.authenticationBloc}) : super(InitDetailState())
  {

    on<DetailInfoEvents>((event, emit) => _DetailInfoState(event),);}

  var dataRecipes;
  var data = RecipesDataServices();
  int index = 0;

  void _DetailInfoState(DetailInfoEvents event){

    try{
      emit(DetailInfoState(recipe: event.recipe, index: event.index));
    }catch(e){
      print("Error DetailInfoEvents is ${e}");
    }

  }
}
