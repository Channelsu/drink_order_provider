import 'package:drinkorderprovider/widgets/drinks_widget.dart';
import 'package:flutter/material.dart';
import 'package:drinkorderprovider/models/drink.dart';
import 'package:drinkorderprovider/widgets/drinks_widget.dart';
import 'package:provider/provider.dart';
import 'package:drinkorderprovider/provider/drinks_provider.dart';

import '../constants.dart';

class CheckboxProviderScreen extends StatefulWidget {
  @override
  _CheckboxProviderScreenState createState() => _CheckboxProviderScreenState();
}

class _CheckboxProviderScreenState extends State<CheckboxProviderScreen> {
  final List<Drink> drinks = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ドリンクオーダー"),
      ),
      body: Container(
        decoration: kMainBackgroundImage,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: kWhiteBackground,
              // TODO 7: ConsumerウィジェットでColumnウィジェットをラップする
              // TODO 8: buildプロパティの作成
              child: Consumer<DrinksProvider>(
                builder: (context, drinksProvider, child) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "飲み物を選んで下さい",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    // TODO 9: プロバイダーからゲッターで_deinksを取得
                    ...drinksProvider.drinks
                        .map(
                          (drink) => DrinksWidget(
                            drink: drink,
                            onChanged: (value) {
                              // TODO 11: プロバイダーのselectDrinkメソッドを呼び出す
                              drinksProvider.selectDrink(drink, value);
                            },
                          ),
                        )
                        .toList(),
                    Text(
                      "選択された飲み物: ",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) => ListTile(
                          title: Text(
                            // TODO 13.1: プロバイダーから選択されたドリンクを取得
                            drinksProvider.selectedDrinks[index].name,
                          ),
                        ),
                        // TODO 13.2: プロバイダーから選択されたドリンクを取得
                        itemCount: drinksProvider.selectedDrinks.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}