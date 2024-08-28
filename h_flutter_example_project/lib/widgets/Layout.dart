import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../views/AddBurgerScreen.dart';
import '../views/FavoriteBurgerListScreen.dart'; // 버거 즐겨찾기 화면으로 수정
import '../views/RootScreen.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _currentIndex = 0;

  void _onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _pages = [
    const RootScreen(),
    FavoriteBurgerListScreen(), // 버거 즐겨찾기 화면으로 수정
    AddBurgerScreen() // 버거 추가 화면으로 수정
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Burger Cards")), // 제목을 버거로 수정
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood), // 아이콘을 버거에 맞게 변경
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Add",
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onTapped,
      ),
    );
  }
}
