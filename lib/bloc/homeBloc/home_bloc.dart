import 'package:cooking_app/bloc/homeBloc/home_events.dart';
import 'package:cooking_app/bloc/homeBloc/home_states.dart';
import 'package:cooking_app/component/colors.dart';
import 'package:cooking_app/services/recipes_dataServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloC extends Bloc<HomeEvents, HomeState> {
  HomeBloC(this.data) : super(InitState()) {
    on<WelcomeEvents>((event, emit) => emit(WelcomeState()));
    on<LoginEvent>((event, emit) => emit(LoginState()));
    on<RegistrationEvent>((event, emit) => emit(RegistrationState()));
    on<LoadingRecipesEvents>((event, emit) async => {
          emit(LoadingRecipesState()),
          dataRecipes = await data.getRecipesInfo(),
          emit(LoadedRecipesState(dataRecipes)),
        });
    on<ReturnToRecipesHomeEvents>(
        (event, emit) => emit(LoadedRecipesState(dataRecipes)));
    on<DetailRecipesEvents>(
        (event, emit) => emit(DetailRecipesState(dataRecipes[index], index)));
  }

  var dataRecipes;
  var data = RecipesDataServices();
  int index = 0;
  Color backgroundCardColors = AppColors.mainColor;
  Color textCardColors = AppColors.colorWhite;

  void getCardColors(int index) {
    backgroundCardColors =
        index % 2 == 0 ? AppColors.greyBackgroundColor : AppColors.mainColor;
    textCardColors =
        index % 2 == 0 ? AppColors.textColorBlack : AppColors.colorWhite;
  }

  void getIndex(int index) {
    this.index = index;
  }
}
