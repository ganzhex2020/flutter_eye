import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_eye/common/Constant.dart';
import 'package:flutter_eye/ui/page/HomePage.dart';
import 'package:flutter_eye/ui/page/MainPage.dart';
import 'package:flutter_eye/ui/page/SplashPage.dart';
import 'package:flutter_eye/utils/SpUtil.dart';


  void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();

  runApp(MyApp());
  // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
  SystemUiOverlayStyle systemUiOverlayStyle =
  SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}

class MyApp extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
        routes: {
          Constant.routeMain: (context) => MainPage()
        },
        debugShowCheckedModeBanner: false, //去掉页面右上角的debug标识
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new MainPage()
    );
  }
}

/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
     //   title: 'openEye',
        debugShowCheckedModeBanner: false, //去掉页面右上角的debug标识
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new MainPage());
  }


}*/

