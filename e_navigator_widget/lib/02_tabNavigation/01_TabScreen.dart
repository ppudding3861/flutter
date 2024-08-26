import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatelessWidget{

  const TabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("탭 예제"),
            bottom: const TabBar(
                indicatorColor: Colors.red,
                tabs: [
                  Tab(icon: Icon(Icons.directions_car), child: Text("자동차")),
                  Tab(icon: Icon(Icons.directions_train), child: Text("지하철")),
                  Tab(icon: Icon(Icons.directions_bike), child: Text("자전거")),
                ]
            ),
            actions: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: const Icon(Icons.arrow_back))
            ],
          ),
          body: TabBarView(
              children: [
                Center(
                  child: Column(
                    children: [
                      ElevatedButton(
                          onPressed: (){

                          },
                          child: const Text("자동차 타고 PathValue 알아보기"))
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      ElevatedButton(
                          onPressed: (){

                          },
                          child: const Text("지하철 타고 단일 parameter 알아보기"))
                    ],
                  ),
                )
              ],
          ),
        ),
      ),
    );
  }
}