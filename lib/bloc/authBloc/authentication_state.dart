import 'package:cooking_app/model/recipes_dataModel.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {}

class AuthenticationUninitialized extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AuthenticationAuthenticated extends AuthenticationState {
  final String token;

  AuthenticationAuthenticated({required this.token});
  @override
  List<Object?> get props => [token];
}

class AuthenticationUnauthenticated extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AuthenticationLoading extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class DetailAuthenticationState extends AuthenticationState {

  DetailAuthenticationState({required this.token, required this.recipe, required this.index});
  final String token;
  final RecipesDataModel recipe;
  final int index;

  @override
  List<Object> get props => [recipe];
}

class AuthorizationUninitialized extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AuthorizationSuccessfully extends AuthenticationState {
  @override
  List<Object?> get props => [];
}