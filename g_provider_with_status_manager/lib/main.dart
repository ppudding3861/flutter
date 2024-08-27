import 'package:flutter/material.dart';
/*
* provider
* flutter에서 상태관리를 위한 인기 있는 패턴이자 라이브러리로 간단하고 직관적인 api를 통해
* 애플리케이션의 상태를 효율적으로 관리할 수 있도록 해준다.
* provider는 flutter의 inheritedWidget을 기반으로 하고 있으며, 상태를 공유하고 위젯 트리에서
* 필요한 곳에서 쉽게 접근할 수 있도록 한다.
*
* 플러터에서 인기있는 상태관리 패턴
*   1. Riverpod
*   2. Bloc 패턴
*   3. provider <- 우리가 배우고자 하는 상태관리
* */
void main() {
  runApp(const MainApp());
}
