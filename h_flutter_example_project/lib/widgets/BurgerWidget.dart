import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:h_flutter_example_project/controllers/BurgerViewModel.dart'; // 버거 관련 ViewModel로 수정
import 'package:h_flutter_example_project/controllers/BurgerFavoriteViewModel.dart'; // 버거 관련 ViewModel로 수정
import 'package:h_flutter_example_project/models/BurgerItem.dart'; // BurgerItem으로 변경
import 'package:h_flutter_example_project/widgets/ImageWidget.dart';
import 'package:provider/provider.dart';

class BurgerWidget extends StatelessWidget { // 클래스명 변경
  final BurgerItem burgerItem; // 모델 타입 변경
  final int index;

  const BurgerWidget({required this.burgerItem, required this.index, super.key}); // 클래스명 변경 및 super.key 추가

  @override
  Widget build(BuildContext context) {
    final favoriteViewModel = Provider.of<BurgerFavoriteViewModel>(context); // ViewModel 타입 변경
    final burgerViewModel = Provider.of<BurgerViewModel>(context); // ViewModel 타입 변경

    bool isFavorite = favoriteViewModel.isFavorite(index); // 변수명 및 메서드 수정

    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white10,
        border: Border.all(color: Colors.black, width: 2.0),
      ),
      child: ElevatedButton(
        onPressed: () => burgerViewModel.detailsBurgerItem(context, index), // 메서드 이름 수정
        child: Center(
          child: Row(
            children: [
              Text("$index"),
              ImageWidget(image: burgerItem.image.toString()), // 모델 필드 접근 변경
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("제목 : ${burgerItem.title}"), // 모델 필드 접근 변경
                    Text(
                      "내용 : ${burgerItem.description}", // 모델 필드 접근 변경
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 50,
                height: 50,
                child: IconButton(
                  onPressed: () {
                    favoriteViewModel.toggleFavorite(index); // 메서드 이름 수정
                  },
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border, // 변수명 수정
                    color: isFavorite ? Colors.red : Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: 50,
                height: 50,
                child: IconButton(
                  onPressed: () {
                    burgerViewModel.deleteItem(context, index - 1); // 메서드 호출 수정
                  },
                  icon: const Icon(
                    Icons.cancel,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
