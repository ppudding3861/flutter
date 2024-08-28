import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/BurgerItem.dart'; // 모델 경로 수정

class BurgerDetailScreen extends StatelessWidget { // 클래스명 변경
  final BurgerItem? burgerItem; // 변수 타입 및 이름 변경

  BurgerDetailScreen({required this.burgerItem, super.key}); // 생성자 변경

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(burgerItem!.title.toString())), // 변수명 변경
      body: Column(
        children: [
          Image.network(burgerItem!.image.toString()), // 변수명 변경
          const SizedBox(height: 16),
          Text(burgerItem!.description.toString()) // 변수명 변경
        ],
      ),
    );
  }
}
