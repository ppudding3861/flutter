import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  final String? value; // 값의 타입을 final로 변경하여 불변으로 만듦
  final Function(String?) setValue; // Function 타입을 명확하게 유지

  const FormWidget({required this.value, required this.setValue, super.key}); // super.key 추가

  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.value,
      decoration: const InputDecoration(labelText: "값을 입력하세요"), // label -> labelText로 수정
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "값을 입력해 주세요";
        }
        return null;
      },
      onSaved: widget.setValue,
    );
  }
}
