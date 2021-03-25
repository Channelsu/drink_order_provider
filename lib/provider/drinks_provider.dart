import 'package:flutter/foundation.dart';
import 'package:drinkorderprovider/models/drink.dart';

// TODO 1: ドリンクのプロバイダークラス作成
// TODO 2: ChangeNotifierクラスを継承
// TODO 3: drinks配列の状態を初期化
// TODO 4: drinksのゲッター作成
// TODO 10: Implement the selectDrink method
// TODO 12: Implement a getter function for selected Drinks

class DrinkProvider extends ChangeNotifier {
  // 外から変更されてはいけないのでプライベート化
  List<Drink> _drinks = [
    Drink("水", false),
    Drink("コーラ", false),
    Drink("ポカリ", false),
    Drink("十六茶", false)
  ];

  List<Drink> get drinks => _drinks;
}