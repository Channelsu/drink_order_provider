import 'package:drinkorderprovider/setState/checkbox_setState_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ドリンク',
      theme: ThemeData.light().copyWith(primaryColor: Color(0xFFe13133)),
      // TODO 5: ChangeNotifierProviderを登録
      // TODO 6: createメソッドを追加。DrinksProviderのインスタンスを生成
      home: CheckBoxSetStateScreen(),
    );
  }
}