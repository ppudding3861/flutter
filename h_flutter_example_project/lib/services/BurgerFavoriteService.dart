import 'dart:async';

import 'package:h_flutter_example_project/models/BurgerFavoriteItem.dart'; // 파일 이름 변경
import 'package:hive/hive.dart';

class BurgerFavoriteService { // 클래스명 변경
  final Box<BurgerFavoriteItem> _favoriteBox = Hive.box<BurgerFavoriteItem>("burgerFavoriteBox"); // 박스 타입 및 이름 변경

  bool isFavorite(int index) {
    return _favoriteBox.values.any((item) => item.index == index); // 박스 타입 변경
  }

  void toggleFavorite(int index) {
    BurgerFavoriteItem? favoriteItem;

    for (var item in _favoriteBox.values) {
      if (item.index == index) {
        favoriteItem = item;
        break;
      }
    }

    if (favoriteItem != null) {
      _favoriteBox.deleteAt(_favoriteBox.values.toList().indexOf(favoriteItem));
    } else {
      _favoriteBox.add(BurgerFavoriteItem(index)); // 항목 타입 변경
    }
  }

  List<int> getFavoriteIndices() {
    List<int> list = [];

    for (var item in _favoriteBox.values) {
      list.add(item.index);
    }
    return list;
  }
}
