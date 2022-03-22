import 'package:cooking_app/cubit/cubit_blocBuilder.dart';
import 'package:cooking_app/cubit/cubits.dart';
import 'package:cooking_app/pages/detail_page.dart';
import 'package:cooking_app/pages/mainNavPages/main_page.dart';
import 'package:cooking_app/services/recipes_dataServices.dart';
import 'package:flutter/material.dart';
import 'package:cooking_app/pages/welcome_page.dart';
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
      theme: ThemeData(
      ),
      home: BlocProvider<Cubits>(
        create: (context) => Cubits(data: RecipesDataServices(),),
        child: CubitBlocBuilder(),
    ),
    );
  }
}

