import 'package:flutter/cupertino.dart';
import 'package:h_flutter_example_project/controllers/BurgerViewModel.dart'; // Burger 관련 ViewModel로 수정
import 'package:h_flutter_example_project/controllers/BurgerFavoriteViewModel.dart'; // Burger 관련 ViewModel로 수정
import 'package:h_flutter_example_project/models/BurgerItem.dart'; // Burger 모델로 수정
import 'package:h_flutter_example_project/widgets/BurgerWidget.dart'; // CoffeeWidget을 BurgerWidget으로 수정
import 'package:provider/provider.dart';

class FavoriteBurgerListScreen extends StatelessWidget { // 클래스명 변경

  FavoriteBurgerListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteViewModel = Provider.of<BurgerFavoriteViewModel>(context); // ViewModel 변경
    final burgerViewModel = Provider.of<BurgerViewModel>(context); // ViewModel 변경

    List<int> favoriteIndices = favoriteViewModel.getFavoriteIndices();
    List<BurgerItem> favoriteItems = favoriteIndices.map((index) => burgerViewModel.burgerItems[index - 1]).toList(); // BurgerItem으로 변경

    return ListView.builder(
      itemCount: favoriteItems.length,
      itemBuilder: (context, index) {
        final burgerItem = favoriteItems[index]; // 변수명 변경
        return BurgerWidget(burgerItem: burgerItem, index: favoriteIndices[index]); // Widget 및 변수명 변경
      },
    );
  }
}
