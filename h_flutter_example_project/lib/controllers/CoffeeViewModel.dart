import 'package:flutter/cupertino.dart';
import '../services/CoffeeService.dart';
import '../models/CoffeeItem.dart';


class CoffeeViewModel extends ChangeNotifier{
  List<CoffeeItem> _coffeeItems = [];
  List<CoffeeItem> get coffeeItems => _coffeeItems;


  final CoffeeService _coffeeService;


  CoffeeViewModel(this._coffeeService){
    _initializeHive();
  }

  Future<void> _initializeHive() async{
    await _coffeeService.initalizeHive();
    await fetchCoffeeItems();
  }

  Future<void> fetchCoffeeItems() async{
    _coffeeItems = await _coffeeService.fetchCoffeeItems();
    notifyListeners();
  }

}