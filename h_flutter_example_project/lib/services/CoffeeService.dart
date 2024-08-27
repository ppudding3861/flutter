import 'dart:convert';

import 'package:h_flutter_example_project/models/CoffeeItem.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class CoffeeService{
  Box<CoffeeItem>? _coffeeBox;

  Future<void> initalizeHive() async{
    _coffeeBox = await Hive.openBox<CoffeeItem>("coffeeBox");
    await fetchCoffeeItems();
  }

  Future<List<CoffeeItem>> fetchCoffeeItems() async{
    if(_coffeeBox!.isNotEmpty){
      // coffeebox의 데이터를 list형식으로 반환함.
      return _coffeeBox!.values.toList();
    }

    const url = "https://api.sampleapis.com/coffee/hot";

    try{
      final response = await http.get(Uri.parse(url));

      if(response.statusCode == 200){
        List<dynamic> fetchedItems = json.decode(response.body);

        List<CoffeeItem> coffeeItems = fetchedItems.map(
                (item) => CoffeeItem.fromJson(item)
        ).toList();

        for(var coffee in coffeeItems){
          _coffeeBox!.add(coffee);
        }
        return coffeeItems;
      }else{
        print("요청 실패 : ${response.statusCode}");
        return [];
      }
    }catch(e){
      print("에러발생 : $e");
      return [];
    }
  }

}