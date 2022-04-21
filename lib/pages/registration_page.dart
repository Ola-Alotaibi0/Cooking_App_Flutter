import 'package:cooking_app/bloc/authBloc/authentication_bloc.dart';
import 'package:cooking_app/bloc/authBloc/authentication_event.dart';
import 'package:cooking_app/bloc/registrationBloc/registration_bloc.dart';
import 'package:cooking_app/bloc/registrationBloc/registration_event.dart';
import 'package:cooking_app/bloc/registrationBloc/registration_state.dart';
import 'package:cooking_app/component/colors.dart';
import 'package:cooking_app/services/registration_dataServices.dart';
import 'package:cooking_app/widgets/loading_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegistrationPageParent extends StatelessWidget {
  RegistrationDataServices registrationDataServices;
  AuthenticationBloc authenticationBloc;
  RegistrationPageParent({required this.registrationDataServices, required this.authenticationBloc});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationBloc(registrationDataServices: registrationDataServices, authenticationBloc: authenticationBloc),
      child: RegistrationPage(registrationDataServices: registrationDataServices ),
    );
  }

}

class RegistrationPage extends StatefulWidget {
  final RegistrationDataServices registrationDataServices;
  RegistrationPage({Key? key, required this.registrationDataServices}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}


class _RegistrationPageState extends State<RegistrationPage> {
  late AuthenticationBloc _authenticationBloc;
  late RegistrationBloc _registrationBloc;

  @override
  void initState() {
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _registrationBloc = RegistrationBloc(
        registrationDataServices: widget.registrationDataServices,
        authenticationBloc: _authenticationBloc);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    Size size = MediaQuery.of(context).size;
    final TextEditingController _EmailController = TextEditingController();
    final TextEditingController _PasswordController = TextEditingController();

    return GestureDetector(
      onTap: (){
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      },
      child: Scaffold(

          body: BlocListener<RegistrationBloc, RegistrationState>(
            bloc: _registrationBloc,
              listener: (context, state) {
                BuildContext dialogContext = context;

                if(state is RegistrationLoading){
                  loadingDialog(dialogContext,"Loading..",CupertinoActivityIndicator(radius: 15));

                }if(state is RegistrationSuccessfully){
                  Navigator.pop(dialogContext);
                  DialogWithButton(dialogContext, "Success", "The account has been created successfully, Please log in with the same email and password you created");
                }
                if(state is RegistrationFailure){
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${state.error}'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },

          child: Container(
              height: size.height,
              width: size.width,
              color: AppColors.colorWhite,
              child: Stack(
                children: [
                  Positioned(
                    right: size.height * 0.03,
                    top: size.height * 0.07,
                    child: Container(
                      height: size.height * 0.9,
                      width: size.height * 0.9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(size.height * 0.5),
                          color: AppColors.greyBackgroundColor,
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.textColorBlack.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 10,
                                blurStyle: BlurStyle.outer),
                          ]),
                    ),
                  ),
                  Container(
                    height: size.height,
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              height: size.height * 0.3,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Create\nAccount",
                                  style: TextStyle(
                                      color: AppColors.mainColor,
                                      fontSize: 44,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Container(
                              height: size.height * 0.6,

                              child: ListView(
                                children: [
                                  TextField(
                                    controller: _EmailController,
                                    keyboardType: TextInputType.emailAddress,
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                          fontSize: 20, color: Colors.grey),
                                      hintText: "Email",
                                      contentPadding: EdgeInsets.all(10),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.mainColor
                                                .withOpacity(0.6),
                                            width: 2),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.textButtonColor,
                                            width: 2),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  TextField(

                                    controller: _PasswordController,
                                    obscureText: true,
                                    keyboardType: TextInputType.visiblePassword,
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                          fontSize: 20, color: Colors.grey),
                                      hintText: "Password",
                                      contentPadding: EdgeInsets.all(10),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.mainColor
                                                .withOpacity(0.6),
                                            width: 2),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.textButtonColor,
                                            width: 2),

                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 90),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Sign up",
                                        style: TextStyle(
                                            color: AppColors.mainColor,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          _registrationBloc.add(RegistrationButtonPressed(email: _EmailController.text, password: _PasswordController.text));
                                        },
                                        child: Icon(
                                            FontAwesomeIcons.longArrowAltRight,
                                            color: AppColors.colorWhite),
                                        style: ElevatedButton.styleFrom(
                                          shape: CircleBorder(),
                                          padding: EdgeInsets.all(20),
                                          primary: AppColors.mainColor,
                                          onPrimary: AppColors
                                              .textButtonColor,
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 30),

                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: InkWell(
                                      splashColor: Colors.white,
                                      onTap: () {
                                        _authenticationBloc.add(AppStarted());
                                      },
                                      child: Text(
                                        'Sign in',
                                        style: TextStyle(
                                          fontSize: 19,
                                          decoration: TextDecoration.underline,
                                          color: AppColors.textButtonColor,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            ),

          ),),


    );
  }

  @override
  void dispose() {
    _registrationBloc.close();
    super.dispose();
  }
}
