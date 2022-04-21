import 'package:cooking_app/bloc/authBloc/authentication_bloc.dart';
import 'package:cooking_app/bloc/authBloc/authentication_event.dart';
import 'package:bloc/bloc.dart';
import 'package:cooking_app/bloc/registrationBloc/registration_event.dart';
import 'package:cooking_app/bloc/registrationBloc/registration_state.dart';
import 'package:cooking_app/services/registration_dataServices.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final RegistrationDataServices registrationDataServices;
  final AuthenticationBloc authenticationBloc;

  RegistrationBloc({
    required this.registrationDataServices,
    required this.authenticationBloc,
  })  : assert(registrationDataServices != null),
        assert(authenticationBloc != null),
        super(RegistrationInitial()) {
    on<RegistrationButtonPressed>(
      (event, emit) => _RegistrationButtonPressedEventToStateBloc(event),
    );
  }

  var user;
  var isRegister;
  var errorMessageRegister;

  void _RegistrationButtonPressedEventToStateBloc(
      RegistrationButtonPressed event) async {
    try {
      user = await registrationDataServices.registrationUserInfo(
        event.email,
        event.password,
      );

      isRegister = await registrationDataServices.successfulRegistration();

      if (isRegister) {

        emit(RegistrationLoading());
        await Future.delayed(Duration(seconds: 3));
        authenticationBloc.add(AuthorizationSuccessfullyEvent());
        emit(RegistrationSuccessfully());

      } else {

        errorMessageRegister = await registrationDataServices.errorMessageRegistration();
        print(
            " emit(RegistrationFailure(error: errorMessageRegister)), errorMessageRegister ${errorMessageRegister}");
        emit(RegistrationFailure(error: errorMessageRegister));

      }
    } catch (e) {
      print("Error RegistrationButtonPressed in RegistrationBloc it's ${e}");
    }
  }
}
