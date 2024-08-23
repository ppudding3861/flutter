import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatefulWidget{

  @override
  _ProgressIndicatorState createState() => _ProgressIndicatorState();
}

class _ProgressIndicatorState extends State<ProgressIndicatorWidget>{
  late double value = 0.0;

  void increment(){
    setState(() {
      if(value >= 1.0){
        value = 1.0;
      }else{
        value = double.parse((value + 0.1).toStringAsFixed(1));
      }
    });
  }

  void reset(){
    setState(() {
      value = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CirularProgress(value: value),
        Row(
          children: [
            ElevatedButton(onPressed: increment, child: Text("value++")),
            ElevatedButton(onPressed: reset, child: Text("reset"))
          ],
        )
      ],
    );
  }
}

class CirularProgress extends StatelessWidget{
  late double value;

  CirularProgress({required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        value: value,
        semanticsValue: "스크린 리더가 읽어 줄 값",
        semanticsLabel: "보조 기술을 이용하여 읽어줄 라벨을 지정",
        strokeWidth: 6.0,
        backgroundColor: Colors.red,
        valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
      ),
    );
  }
}