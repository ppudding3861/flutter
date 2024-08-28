import 'package:hive/hive.dart';

part 'BurgerFavoriteItem.g.dart'; // 파일명 변경

@HiveType(typeId: 1)
class BurgerFavoriteItem { // 클래스명 변경

  @HiveField(0)
  final int index;

  BurgerFavoriteItem(this.index);

  @override
  String toString() {
    return index.toString();
  }
}
