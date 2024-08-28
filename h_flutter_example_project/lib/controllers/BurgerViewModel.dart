import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../services/BurgerService.dart'; // 서비스 파일명 변경
import '../models/BurgerItem.dart'; // 모델 파일명 변경
import '../views/BurgerDetailScreen.dart'; // 상세화면 파일명 변경

class BurgerViewModel extends ChangeNotifier {
  List<BurgerItem> _burgerItems = []; // 커피 -> 버거
  List<BurgerItem> get burgerItems => _burgerItems;

  BurgerItem? _burgerItem = BurgerItem.empty();
  BurgerItem? get burgerItem => _burgerItem;

  final BurgerService _burgerService; // 서비스명 변경

  BurgerViewModel(this._burgerService) {
    _initializeHive();
  }

  Future<void> _initializeHive() async {
    await _burgerService.initializeHive(); // 커피 -> 버거 서비스
    await fetchBurgerItems(); // 커피 아이템 -> 버거 아이템
  }

  Future<void> fetchBurgerItems() async { // 커피 아이템 -> 버거 아이템
    _burgerItems = await _burgerService.fetchBurgerItems();
    notifyListeners();
  }

  Future<void> detailsBurgerItem(BuildContext context, int index) async { // 커피 -> 버거
    _burgerItem = _burgerItems[index];
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BurgerDetailScreen(burgerItem: _burgerItem), // 상세화면 변경
      ),
    );
    notifyListeners();
  }

  void deleteItem(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("삭제 확인"),
        content: Text("정말로 이 항목을 삭제하시겠습니까?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // 대화상자 닫기
            },
            child: Text("취소"),
          ),
          TextButton(
            onPressed: () async {
              try {
                await _burgerService.deleteBurgerItem(index); // 커피 -> 버거 서비스
                _burgerItems.removeAt(index);
                notifyListeners();
                Navigator.of(context).pop();
              } catch (e) {
                print("삭제 중 오류 발생 : $e");
              }
            },
            child: Text("삭제"),
          ),
        ],
      ),
    );
  }

  void setImage([String? path]) {
    if (_burgerItem?.image == null) {
      _burgerItem?.image = path;
    } else {
      _burgerItem?.image = null;
    }
    notifyListeners();
  }

  void setTitle(String? title) {
    _burgerItem?.title = title;
  }

  void setDescription(String? description) {
    _burgerItem?.description = description;
  }

  bool validateForm(GlobalKey<FormState> formKey) {
    return formKey.currentState!.validate();
  }

  void saveForm(GlobalKey<FormState> formKey, BuildContext context) async {
    if (validateForm(formKey)) {
      formKey.currentState!.save();
      if (_burgerItem != null) {
        try {
          await _burgerService.addBurgerItem(_burgerItem!); // 커피 -> 버거 서비스
          formKey.currentState!.reset();
          _burgerItem = BurgerItem.empty(); // 빈 버거 아이템으로 초기화

          Navigator.pushNamed(context, "/");
        } catch (e) {
          print("Hive에 데이터를 저장하는 과정에서 오류 발생 : $e");
        }
      } else {
        print("burgerItem이 유효하지 않습니다.");
      }
    }
  }
}
