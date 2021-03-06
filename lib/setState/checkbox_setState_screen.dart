import 'package:flutter/material.dart';
import 'package:drinkorderprovider/models/drink.dart';
import 'package:drinkorderprovider/widgets/drinks_widget.dart';

import '../constants.dart';

// Widget
class CheckBoxSetStateScreen extends StatefulWidget {
  @override
  _CheckBoxSetStateScreenState createState() => _CheckBoxSetStateScreenState();
}

class _CheckBoxSetStateScreenState extends State<CheckBoxSetStateScreen> {
  List<Drink> drinks = [
    Drink("水", false),
    Drink("コーラ", false),
    Drink("ポカリ", false),
    Drink("十六茶", false)
  ];

  @override
  Widget build(BuildContext context) {
    var selectedDrinks = drinks.where((element) => element.selected);

    return Scaffold(
      appBar: AppBar(
        title: Text("Cocktail Order"),
      ),
      body: Container(
        decoration: kMainBackgroundImage,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: kWhiteBackground,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "飲み物を選択して下さい",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  ...drinks
                      .map(
                        (drink) => DrinksWidget(
                          drink: drink,
                          onChanged: (value) {
                            setState(() {
                              drink.selected = value;
                            });
                          },
                        ),
                      )
                      .toList(),
                  Text(
                    "選択された飲み物",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => ListTile(
                        title: Text(
                          selectedDrinks.toList()[index].name,
                        ),
                      ),
                      itemCount: selectedDrinks.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}