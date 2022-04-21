import 'package:equatable/equatable.dart';

abstract class RegistrationEvent extends Equatable {}

class RegistrationButtonPressed extends RegistrationEvent {
  final String email;
  final String password;

  RegistrationButtonPressed({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];

}