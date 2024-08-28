import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/CoffeeItem.dart';

class CoffeeDetailScreen extends StatelessWidget{
  CoffeeItem? coffeeItem;

  CoffeeDetailScreen({required this.coffeeItem, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(coffeeItem!.title.toString())),
      body: Column(
        children: [
          Image.network(coffeeItem!.image.toString()),
          const SizedBox(height: 16),
          Text(coffeeItem!.description.toString())
        ],
      ),
    );
  }
}