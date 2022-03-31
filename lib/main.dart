import 'package:cooking_app/bloc/homeBloc/home_bloc.dart';
import 'package:cooking_app/bloc/homeBloc/home_events.dart';
import 'package:cooking_app/recipes_provider.dart';
import 'package:cooking_app/services/recipes_dataServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => HomeBloC(RecipesDataServices())..add(WelcomeEvents())),
          ],
          child: RecipesProvider(),
        ));
  }
}
