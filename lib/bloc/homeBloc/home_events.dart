import 'package:equatable/equatable.dart';

abstract class HomeEvents extends Equatable {}

class InitialEvents extends HomeEvents {

  @override
  List<Object> get props => [];
}

class LoadedRecipesDataEvents extends HomeEvents {
  @override
  List<Object?> get props => [];
}

class LoadingRecipesEvents extends HomeEvents {
  @override
  List<Object> get props => [];
}

