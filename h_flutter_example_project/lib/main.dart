
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:h_flutter_example_project/controllers/BurgerViewModel.dart';
import 'package:h_flutter_example_project/controllers/BurgerFavoriteViewModel.dart';
import 'package:h_flutter_example_project/models/BurgerItem.dart'; // BurgerItem으로 수정
import 'package:h_flutter_example_project/models/BurgerFavoriteItem.dart'; // BurgerFavoriteItem으로 수정
import 'package:h_flutter_example_project/services/BurgerService.dart';
import 'package:h_flutter_example_project/services/BurgerFavoriteService.dart';
import 'package:h_flutter_example_project/themes/BurgerAppTheme.dart'; // BurgerAppTheme으로 수정
import 'package:h_flutter_example_project/widgets/Layout.dart'; // Layout 위젯 임포트 경로 수정
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';


/*
* 임포트 lib 목록
* $flutter pub add hive           : 경량 nosql
* $flutter pub add http           : api 요청
* $flutter pub add provider       : 상태관리
* $flutter pub add path_provider  : 어플리케이션의 경로를 취득하기 위함
* $flutter pub add camera         : 카메라 모듈
* $flutter pub add build_runner   : 클래스의 반복적인 부분을 하나의 코드로 변환함
* $flutter pub add hive_generator : hive에 model을 저장할 때 직렬화를 위해서 사용됨
* */

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  Hive.registerAdapter(BurgerItemAdapter()); // BurgerItemAdapter로 수정
  Hive.registerAdapter(BurgerFavoriteItemAdapter()); // BurgerFavoriteItemAdapter로 수정

  await Hive.openBox<BurgerFavoriteItem>("burgerFavoriteBox"); // favoriteBox 이름 수정

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => BurgerViewModel(BurgerService()), // Burger 관련 ViewModel로 수정
      ),
      ChangeNotifierProvider(
        create: (context) => BurgerFavoriteViewModel(BurgerFavoriteService()), // Burger 관련 ViewModel로 수정
      ),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 화면의 가장자리까지 공간을 차지하도록 설정
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    return MaterialApp(
      debugShowCheckedModeBanner: false, // 오른쪽 상단의 띠를 제거함
      title: "My Burger App", // 앱 제목을 버거로 변경
      theme: BurgerAppTheme.lightTheme, // 테마를 BurgerAppTheme으로 변경
      darkTheme: BurgerAppTheme.darkTheme, // 테마를 BurgerAppTheme으로 변경
      initialRoute: "/",
      routes: {
        "/": (context) => const Layout(), // Layout 위젯으로 경로 설정
      },
    );
  }
}
