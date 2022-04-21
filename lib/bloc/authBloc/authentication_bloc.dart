import 'package:cooking_app/bloc/authBloc/authentication_event.dart';
import 'package:cooking_app/bloc/authBloc/authentication_state.dart';
import 'package:bloc/bloc.dart';
import 'package:cooking_app/services/login_dataServices.dart';
import 'package:cooking_app/services/registration_dataServices.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final RegistrationDataServices registrationDataServices;
  final LoginDataServices loginDataServices;

  AuthenticationBloc({required this.loginDataServices, required this.registrationDataServices, })
      : assert(loginDataServices != null), super(AuthenticationUninitialized()){

    on<AppStarted>((event, emit) async => _AppStarted(event));
    on<LoggedIn>((event, emit) async => _LoggedInStateAuth(event),);
    on<DetailAuthenticationEvent>((event, emit) => _DetailAuthentication(event),);
    on<ReturnFromDetailToHomeEvent>((event, emit) async => _AuthenticationReturnFromDetailToHome(event));
    on<AuthorizationUninitializedEvent>((event, emit) => _AuthorizationUninitialized(event));
    on<AuthorizationSuccessfullyEvent>((event, emit) => _AuthorizationSuccessfully(event));

  }
  var token;
   var isAuth;
  var loginDataToken;

  void _LoggedInStateAuth(LoggedIn event) async {
    try{
      token = event.isLoggedInData.token;
      if(token != null){
        emit(AuthenticationLoading());
        emit(AuthenticationAuthenticated(token: token));
      }else{
        print("Error token it's null");
      }
    }catch(e){
      print("Error LoggedIn in AuthenticationBloc is ${e}");
    }
  }

  void _DetailAuthentication(DetailAuthenticationEvent event){
    try{
      emit(DetailAuthenticationState(token: token, recipe: event.recipe, index: event.index));
    }catch(e){
      print("Error DetailAuthenticationEvent in AuthenticationBloc it's ${e}");
      print("DetailAuthenticationEvent token ${token}");
    }
  }

  void _AuthenticationReturnFromDetailToHome(ReturnFromDetailToHomeEvent event){
    try{
    emit(AuthenticationAuthenticated(token: token));
    }catch(e){
      print("Error ReturnFromDetailToHomeEvent in AuthenticationBloc it's ${e}");
    print("ReturnFromDetailToHomeEvent ${token}");
    }
  }

  void _AuthorizationUninitialized(AuthorizationUninitializedEvent event){
    try{
      emit(AuthorizationUninitialized());
    }catch(e){
      print("Error AuthorizationUninitializedEvent in AuthenticationBloc it's ${e}");
    }
  }

  void _AuthorizationSuccessfully(AuthorizationSuccessfullyEvent event){
    try{
      emit(AuthorizationSuccessfully());
      emit(AuthenticationUnauthenticated());
    }catch(e){
      print("Error AuthorizationSuccessfullyEvent in AuthenticationBloc it's ${e}");
    }
  }

  void _AppStarted(AppStarted event){
    try{
      emit(AuthenticationUnauthenticated());
    }catch(e){
      print("Error AppStarted in AuthenticationBloc it's ${e}");
    }
  }

}