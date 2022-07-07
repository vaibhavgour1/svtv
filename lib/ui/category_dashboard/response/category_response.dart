import 'dart:convert';

class CategoryResponse {
  CategoryResponse({
    required this.error,
    required this.message,
    this.category,
  });

  bool error;
  String message;
  List<CategoryList>? category;

  factory CategoryResponse.fromJson(String str) =>
      CategoryResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryResponse.fromMap(Map<String, dynamic> json) =>
      CategoryResponse(
        error: json["error"] == null ? false : json["error"],
        message: json["message"] == null ? "" : json["message"],
        category: json["category"] == null
            ? []
            : List<CategoryList>.from(
                json["category"].map((x) => CategoryList.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "error": error == null ? null : error,
        "message": message == null ? null : message,
        "category": category == null
            ? null
            : List<dynamic>.from(category!.map((x) => x.toMap())),
      };
}

class CategoryList {
  CategoryList({
   required this.id,
   required this.categoryName,
   required this.categoryIcon,
  });

  String id;
  String categoryName;
  String categoryIcon;

  factory CategoryList.fromJson(String str) => CategoryList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryList.fromMap(Map<String, dynamic> json) => CategoryList(
        id: json["id"] == null ? "0" : json["id"],
        categoryName:
            json["category_name"] == null ? "" : json["category_name"],
        categoryIcon:
            json["category_icon"] == null ? "" : json["category_icon"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "category_name": categoryName == null ? "" : categoryName,
        "category_icon": categoryIcon == null ? "" : categoryIcon,
      };
}
