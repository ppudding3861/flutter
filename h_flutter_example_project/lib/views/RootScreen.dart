import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:h_flutter_example_project/controllers/BurgerViewModel.dart'; // Burger 관련 ViewModel로 수정
import 'package:provider/provider.dart';

import '../widgets/BurgerWidget.dart'; // Burger 관련 위젯으로 수정

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<RootScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<BurgerViewModel>(context, listen: false).fetchBurgerItems(); // Burger 관련 메서드 호출
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BurgerViewModel>( // BurgerViewModel로 변경
      builder: (context, viewModel, child) {
        return Container(
          color: Colors.white,
          child: ListView.builder(
            itemCount: viewModel.burgerItems.length, // Burger 아이템 사용
            itemBuilder: (context, index) {
              final burgerItem = viewModel.burgerItems[index]; // 변수명 변경
              return BurgerWidget(burgerItem: burgerItem, index: index + 1); // Burger 관련 위젯으로 수정
            },
          ),
        );
      },
    );
  }
}
