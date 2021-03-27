import 'package:drinkorderprovider/provider/drinks_provider.dart';
import 'package:drinkorderprovider/setState/checkbox_setState_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      // TODO 5: ChangeNotifierProviderで覆う
      // TODO 6: createプロパティを追加。DrinksProviderのインスタンスを生成
      home: ChangeNotifierProvider(
        create: (_) => DrinksProvider(),
        child: CheckBoxSetStateScreen()
      ),
    );
  }
}