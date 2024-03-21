import 'dart:convert';

class DetailRestaurantModel {
  final List<Meal> meals;

  DetailRestaurantModel({
    required this.meals,
  });

  factory DetailRestaurantModel.fromJson(String str) =>
      DetailRestaurantModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DetailRestaurantModel.fromMap(Map<String, dynamic> json) =>
      DetailRestaurantModel(
        meals: List<Meal>.from(json["meals"].map((x) => Meal.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "meals": List<dynamic>.from(meals.map((x) => x.toMap())),
      };
}

class Meal {
  final String strMeal;
  final String strMealThumb;
  final String idMeal;

  Meal({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });

  factory Meal.fromJson(String str) => Meal.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Meal.fromMap(Map<String, dynamic> json) => Meal(
        strMeal: json["strMeal"],
        strMealThumb: json["strMealThumb"],
        idMeal: json["idMeal"],
      );

  Map<String, dynamic> toMap() => {
        "strMeal": strMeal,
        "strMealThumb": strMealThumb,
        "idMeal": idMeal,
      };
}
