import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveScreen extends StatefulWidget{

  @override
  _HiveState createState() => _HiveState();
}

class _HiveState extends State<HiveScreen>{
  Box? box; // 데이터를 저장하기 위한 용도의 박스이다.

  @override
  void initState() {
    super.initState();
    _openHiveBox();
  }

  Future<void> _openHiveBox() async{
    box = await Hive.openBox("myBox");
    setState(() {

    });

  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          box == null
              ? const Center(child: CircularProgressIndicator())
              : const Center(child: Text("hive box is Ready!")),
          ElevatedButton(onPressed: (){
            box!.put("key", "hello hive");
          }, child: const Text("데이터 저장")),
          ElevatedButton(onPressed: (){
            final value = box!.get("key");
            print(value);
          }, child: Text("조회"))


        ],
      ),
    );
  }
}