import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:h_flutter_example_project/controllers/BurgerViewModel.dart'; // ViewModel 경로 수정
import 'package:provider/provider.dart';

import '../widgets/CameraWidget.dart';
import '../widgets/FormWidget.dart';

class AddBurgerScreen extends StatelessWidget { // 클래스명 변경
  final _burgerForm = GlobalKey<FormState>(); // 변수명 변경

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<BurgerViewModel>(context); // ViewModel 타입 변경

    return ListView(
      children: [
        Form(
          key: _burgerForm, // 변수명 변경
          child: Center(
            child: Column(
              children: [
                CameraWidget(imagePath: viewModel.burgerItem?.image, setMethod: viewModel.setImage), // 변수명 변경
                FormWidget(value: viewModel.burgerItem?.title ?? "", setValue: viewModel.setTitle), // 변수명 변경
                FormWidget(value: viewModel.burgerItem?.description ?? "", setValue: viewModel.setDescription), // 변수명 변경
                ElevatedButton(
                  onPressed: () {
                    viewModel.saveForm(_burgerForm, context); // 변수명 변경
                  },
                  child: const Text("저장"),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
