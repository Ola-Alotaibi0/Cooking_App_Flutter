import 'dart:convert';
import 'package:cooking_app/model/recipes_dataModel.dart';
import 'package:http/http.dart' as http;

class RecipesDataServices {
  Future<List<RecipesDataModel>> getRecipesInfo() async {
    var apiUrl = "https://recipeappserver.herokuapp.com/getAllRecipes";
    http.Response res = await http.get(Uri.parse(apiUrl));

    try {
      if (res.statusCode == 200) {
        Map<String, dynamic> map = json.decode(res.body);
        List<dynamic> list = map["recipes"];
        return list.map((e) => RecipesDataModel.fromJson(e)).toList();
      } else {
        print("Error RecipesDataServices");
        return <RecipesDataModel>[];
      }
    } catch (e) {
      print("Error RecipesDataServices");
      print(e);
      return <RecipesDataModel>[];
    }
  }
}
