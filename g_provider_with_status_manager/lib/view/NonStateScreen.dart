import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NonStateScreen extends StatefulWidget{

  @override
  NoneState createState() => NoneState();
}

class NoneState extends State<NonStateScreen>{
  int _count = 0;

  void increment(){
    setState(() {
      _count++;
    });
  }
  void decrement(){
    setState(() {
      _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("--------------------");
    print("상태 관리를 하지 않는 경우");
    print("--------------------");

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _NonText(_count),
          SizedBox(height: 20),
          ElevatedButton(onPressed: increment, child: const Text("증가")),
          ElevatedButton(onPressed: decrement, child: const Text("감소")),
        ],
      ),
    );
  }
}

class _NonText extends StatelessWidget{
  int? _count;

  _NonText(this._count);

  @override
  Widget build(BuildContext context) {
    print("----------------");
    print("_NonText");
    print("----------------");

    return Text(
      "Counter : $_count",
      style: const TextStyle(fontSize: 24),
    );
  }
}

