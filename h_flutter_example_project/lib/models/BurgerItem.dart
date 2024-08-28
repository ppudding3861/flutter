import 'package:hive/hive.dart';
part 'BurgerItem.g.dart'; // g.dart 파일 이름 변경

// flutter pub get
// flutter pub run build_runner build

@HiveType(typeId: 0)
class BurgerItem { // 클래스명 변경
  @HiveField(0)
  String? title;

  @HiveField(1)
  String? description;

  @HiveField(2)
  List<String>? ingredients;

  @HiveField(3)
  String? image;

  BurgerItem({required this.title, required this.description, required this.ingredients, required this.image});
  BurgerItem.empty();

  factory BurgerItem.fromJson(Map<String, dynamic> json) {
    List<String> ingredients = [];

    if (json["ingredients"] is List) {
      ingredients = List<String>.from(json["ingredients"]);
    } else {
      ingredients.add(json["ingredients"]);
    }

    return BurgerItem(
      title: json['title'],
      description: json['description'],
      ingredients: ingredients, // List<String>으로 변환
      image: json["image"],
    );
  }
}
