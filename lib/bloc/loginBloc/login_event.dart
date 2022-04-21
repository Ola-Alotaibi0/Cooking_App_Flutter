import 'package:equatable/equatable.dart';

abstract class RegistrationEvent extends Equatable {}

class LoginButtonPressed extends RegistrationEvent {
  final String email;
  final String password;

  LoginButtonPressed({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];

}