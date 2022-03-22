import 'dart:convert';

import 'package:cooking_app/model/recipes_dataModel.dart';
import 'package:http/http.dart' as http;

class RecipesDataServices{
  String baseUrl = "https://recipeappserver.herokuapp.com";

  Future<List<RecipesDataModel>> getRecipesInfo() async{
    var apiUrl = "/getAllRecipes";
    http.Response res = await http.get(Uri.parse(baseUrl+apiUrl));

    try{
      if(res.statusCode == 200){
        print("res.statusCode");
        print(res.statusCode);
        /*print("res.body");
        print(res.body);
        List<dynamic> list = json.decode(res.body);*/
        Map<String, dynamic> map = json.decode(res.body);
        List<dynamic> list = map["recipes"];
        print("list");
        print(list);
        return list.map((e) => RecipesDataModel.fromJson(e)).toList();
      }else{
        print("else");
        return <RecipesDataModel>[];
      }

    }catch(e){
      print("error");
      print(e);
      return <RecipesDataModel>[];
    }
  }
}