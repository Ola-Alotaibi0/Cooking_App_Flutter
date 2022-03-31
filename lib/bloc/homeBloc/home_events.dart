import 'package:cooking_app/model/recipes_dataModel.dart';
import 'package:equatable/equatable.dart';

abstract class HomeEvents extends Equatable {} // add for all events

class InitialEvents extends HomeEvents {
  // add for all events
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class WelcomeEvents extends HomeEvents {
  // welcome Page BloCEvent
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoginEvent extends HomeEvents {
  // welcome Page BloCEvent
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class RegistrationEvent extends HomeEvents {
  // welcome Page BloCEvent
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadedRecipesDataEvents extends HomeEvents {
  // welcome Page BloCEvent
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingRecipesEvents extends HomeEvents {
  // Home Page BloCEvent
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class DetailRecipesEvents extends HomeEvents {
  @override
  List<Object> get props => [];
}

class ReturnToRecipesHomeEvents extends HomeEvents {
  @override
  List<Object> get props => [];
}
