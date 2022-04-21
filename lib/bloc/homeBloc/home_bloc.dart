import 'package:cooking_app/bloc/authBloc/authentication_bloc.dart';
import 'package:cooking_app/bloc/authBloc/authentication_event.dart';
import 'package:cooking_app/bloc/homeBloc/home_events.dart';
import 'package:cooking_app/bloc/homeBloc/home_states.dart';
import 'package:cooking_app/component/colors.dart';
import 'package:cooking_app/services/recipes_dataServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloC extends Bloc<HomeEvents, HomeState> {
  final AuthenticationBloc authenticationBloc;
  HomeBloC({required this.data, required this.authenticationBloc})
      : assert(data != null),
        assert(authenticationBloc != null), super(InitState()) {

    on<LoadingRecipesEvents>((event, emit) => _LoadedRecipesState(event),);

  }


  var dataRecipes;
  var data = RecipesDataServices();
  int index = 0;

  void _LoadedRecipesState(LoadingRecipesEvents event) async {
    try {
      emit(LoadingRecipesState());
      dataRecipes = await data.getRecipesInfo();
      emit(LoadedRecipesState(dataRecipes));
    } catch (e) {
      print("Error LoadingRecipesEvents is ${e}");
    }
  }
}
