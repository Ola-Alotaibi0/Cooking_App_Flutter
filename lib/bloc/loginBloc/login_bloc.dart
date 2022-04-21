import 'package:cooking_app/bloc/authBloc/authentication_bloc.dart';
import 'package:cooking_app/bloc/authBloc/authentication_event.dart';
import 'package:cooking_app/bloc/loginBloc/login_event.dart';
import 'package:cooking_app/bloc/loginBloc/login_state.dart';
import 'package:bloc/bloc.dart';
import 'package:cooking_app/services/login_dataServices.dart';

class LoginBloc extends Bloc<RegistrationEvent, LoginState> {
  final LoginDataServices loginDataServices;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    required this.loginDataServices,
    required this.authenticationBloc,
  })  : assert(loginDataServices != null),
        assert(authenticationBloc != null), super(LoginInitial()){

    on<LoginButtonPressed>((event, emit) => _LoginButtonPressedEventToStateBloc(event),);

  }
  var user;
  var isAuth;

  void _LoginButtonPressedEventToStateBloc(LoginButtonPressed event) async {

    try {

      user = await loginDataServices.loginUserInfo(
        event.email,
        event.password,);

      var hasToken = await loginDataServices.hasToken();

      if (hasToken) {

        emit(LoginLoading());
        await Future.delayed(Duration(seconds: 3));
        authenticationBloc.add(LoggedIn(isLoggedInData: user));
        emit(LoginLogged());

      } else {

        print("emit(LoginFailure(error: loginDataServices.loginDataModel.message!))");
        emit(LoginFailure(error: await loginDataServices.erorrMassege()));

      }
    } catch (e) {
      print("Error LoginButtonPressed in LoginBloc it's ${e}");
    }
  }

}