import 'dart:convert'; // utf8 인코딩 및 디코딩을 위해 필요

import 'package:h_flutter_example_project/models/BurgerItem.dart'; // 모델 파일명 변경
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class BurgerService { // 클래스명 변경
  Box<BurgerItem>? _burgerBox; // 박스 타입 변경

  Future<void> initializeHive() async { // 메서드명 변경
    _burgerBox = await Hive.openBox<BurgerItem>("burgerBox"); // 박스 이름 변경
    await fetchBurgerItems(); // 메서드명 변경
  }

  Future<List<BurgerItem>> fetchBurgerItems() async { // 메서드명 변경
    if (_burgerBox!.isNotEmpty) {
      // burgerBox의 데이터를 list 형식으로 반환함.
      return _burgerBox!.values.toList();
    }

    const url = "http://192.168.0.8:9000/menuItems"; // API URL 변경 (예시 URL)

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // UTF-8 형식으로 응답 본문 디코딩
        List<dynamic> fetchedItems = json.decode(utf8.decode(response.bodyBytes));

        List<BurgerItem> burgerItems = fetchedItems.map(
              (item) => BurgerItem.fromJson(item),
        ).toList();

        for (var burger in burgerItems) {
          _burgerBox!.add(burger);
        }
        return burgerItems;
      } else {
        print("요청 실패 : ${response.statusCode}");
        return [];
      }
    } catch (e) {
      print("에러발생 : $e");
      return [];
    }
  }

  Future<void> deleteBurgerItem(int index) async { // 메서드명 변경
    await _burgerBox?.deleteAt(index);
  }

  Future<void> addBurgerItem(BurgerItem burgerItem) async { // 메서드명 변경
    await _burgerBox?.add(burgerItem);
  }
}
