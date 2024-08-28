import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:h_flutter_example_project/services/BurgerFavoriteService.dart'; // 서비스 파일명 변경

class BurgerFavoriteViewModel extends ChangeNotifier { // 클래스명 변경
  final BurgerFavoriteService _favoriteService; // 서비스명 변경

  BurgerFavoriteViewModel(this._favoriteService);

  bool isFavorite(int index) {
    return _favoriteService.isFavorite(index);
  }

  void toggleFavorite(int index) {
    _favoriteService.toggleFavorite(index);
    notifyListeners();
  }

  List<int> getFavoriteIndices() {
    return _favoriteService.getFavoriteIndices();
  }
}
