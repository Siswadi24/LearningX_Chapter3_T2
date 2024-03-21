import 'dart:convert';

class ListRestoransModel {
  final List<Category> categories;

  ListRestoransModel({
    required this.categories,
  });

  factory ListRestoransModel.fromJson(String str) =>
      ListRestoransModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListRestoransModel.fromMap(Map<String, dynamic> json) =>
      ListRestoransModel(
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toMap())),
      };
}

class Category {
  final String idCategory;
  final String strCategory;
  final String strCategoryThumb;
  final String strCategoryDescription;

  Category({
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryThumb,
    required this.strCategoryDescription,
  });

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        idCategory: json["idCategory"],
        strCategory: json["strCategory"],
        strCategoryThumb: json["strCategoryThumb"],
        strCategoryDescription: json["strCategoryDescription"],
      );

  Map<String, dynamic> toMap() => {
        "idCategory": idCategory,
        "strCategory": strCategory,
        "strCategoryThumb": strCategoryThumb,
        "strCategoryDescription": strCategoryDescription,
      };
}
