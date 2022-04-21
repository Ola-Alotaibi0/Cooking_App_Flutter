import 'package:cooking_app/bloc/authBloc/authentication_bloc.dart';
import 'package:cooking_app/bloc/authBloc/authentication_state.dart';
import 'package:cooking_app/bloc/authBloc/authentication_event.dart';
import 'package:cooking_app/pages/detail_page.dart';
import 'package:cooking_app/pages/login_page.dart';
import 'package:cooking_app/pages/mainNavPages/main_page.dart';
import 'package:cooking_app/pages/registration_page.dart';
import 'package:cooking_app/pages/welcome_page.dart';
import 'package:cooking_app/services/login_dataServices.dart';
import 'package:cooking_app/services/registration_dataServices.dart';
import 'package:cooking_app/widgets/app_large_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: BlocProvider(create: (context) => AuthenticationBloc(loginDataServices: LoginDataServices(), registrationDataServices: RegistrationDataServices()),
            child: App(loginDataServices: LoginDataServices(), registrationDataServices: RegistrationDataServices(),),));

  }

}


class App extends StatefulWidget {
  final RegistrationDataServices registrationDataServices;
  final LoginDataServices loginDataServices;

  App({Key? key, required this.loginDataServices,required this.registrationDataServices}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late AuthenticationBloc authenticationBloc;

  @override
  void initState() {
    authenticationBloc =
        AuthenticationBloc(loginDataServices: widget.loginDataServices, registrationDataServices: widget.registrationDataServices);
    authenticationBloc.add(AppStarted());
  }

  @override
  void dispose() {
    authenticationBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (BuildContext context, AuthenticationState state) {

          if (state is AuthenticationUninitialized) {
            return WelcomePage();
          }
          if (state is AuthenticationAuthenticated) {
            return MainPage(authenticationBloc: authenticationBloc,);
          }
          if (state is AuthenticationUnauthenticated) {
            return LoginPageParent(loginDataServices: widget.loginDataServices, authenticationBloc: authenticationBloc);
          }
          if (state is AuthenticationLoading) {
            return Center(child: CircularProgressIndicator(),);
          }
          if (state is DetailAuthenticationState) {
            return DetailPageParent(authenticationBloc: authenticationBloc, recipe: state.recipe, index: state.index);
          }
          if (state is AuthorizationUninitialized) {
            return RegistrationPageParent(registrationDataServices: widget.registrationDataServices, authenticationBloc: authenticationBloc);
          }
          else{
            return Center(child: AppLargeText(text:"Error BlocBuilder in App class "),);
          }
        },
      ),

    );
  }
}