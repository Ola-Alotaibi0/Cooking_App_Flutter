import 'package:cooking_app/model/login_dataModel.dart';
import 'package:cooking_app/model/recipes_dataModel.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {}

class AppStarted extends AuthenticationEvent {
  @override
  List<Object?> get props => [];
}

class LoggedIn extends AuthenticationEvent {
  final LoginDataModel isLoggedInData;

  LoggedIn({required this.isLoggedInData});

  @override
  List<Object> get props => [isLoggedInData];
}

class LoggedOut extends AuthenticationEvent {

  @override
  List<Object?> get props => [];
}

class DetailAuthenticationEvent extends AuthenticationEvent {
  final RecipesDataModel recipe;
  final int index;

  DetailAuthenticationEvent({required this.recipe, required this.index});
  @override
  List<Object> get props => [recipe];
}

class ReturnFromDetailToHomeEvent extends AuthenticationEvent {

  @override
  List<Object?> get props => [];
}

class AuthorizationUninitializedEvent extends AuthenticationEvent {
  @override
  List<Object?> get props => [];
}
class AuthorizationSuccessfullyEvent extends AuthenticationEvent {
  @override
  List<Object?> get props => [];
}