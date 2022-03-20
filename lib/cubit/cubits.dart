import 'package:bloc/bloc.dart';
import 'package:cooking_app/cubit/cubit_states.dart';

class Cubits extends Cubit<CubitStates>{
  Cubits() : super(InitialState()){
    emit(WelcomeState());
  }

  void getHome(){
    emit(MainNavPageState());
  }

  void getDetail(){
    emit(DetailState());
  }

}