import 'package:equatable/equatable.dart';

abstract class RegistrationState extends Equatable {}

class RegistrationInitial extends RegistrationState {
  @override
  List<Object?> get props => [];
}

class RegistrationLoading extends RegistrationState {
  @override
  List<Object?> get props => [];
}

class RegistrationSuccessfully extends RegistrationState {
  @override
  List<Object?> get props => [];
}

class RegistrationFailure extends RegistrationState {
  final String error;

  RegistrationFailure({required this.error});

  @override
  List<Object> get props => [error];

}