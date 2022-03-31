import 'dart:convert';

import 'package:http/http.dart' as http;

class RecipesDataModel {
  String? name;
  String? description;
  int? kCal;
  List<Ingredients>? ingredients;
  var img;

  RecipesDataModel({
    this.name,
    this.description,
    this.kCal,
    this.ingredients,
    this.img,
  });

  RecipesDataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    kCal = json['kCal'];
    if (json['ingredients'] != null) {
      ingredients = <Ingredients>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(new Ingredients.fromJson(v));
      });

      img = [
        "images/foodImg/food2.jpg",
        "images/foodImg/food1.jpg",
        "images/foodImg/food3.jpg",
        //"images/foodImg/food4.jpg"
      ];
    }
  }
}

class Ingredients {
  String? name;
  String? quantity;
  var img;

  Ingredients({
    this.name,
    this.quantity,
    this.img,
  });

  Ingredients.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];

    img = [
      "images/foodImg/noodle.jpg",
      "images/foodImg/Egg.jpg",
      "images/foodImg/chicken.jpg",
      "images/foodImg/meat.jpg",
    ];
  }
}
