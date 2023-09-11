import 'package:calculator/constants/app_constants.dart';
import 'package:calculator/screens/calculator_screen.dart';
import 'package:calculator/screens/exchange_screen.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ContainedTabBarView(
          tabBarProperties: TabBarProperties(unselectedLabelColor: Color.fromRGBO(64, 196, 189, 0.767),
            width: 250,
            alignment: TabBarAlignment.center,
            indicator: BoxDecoration(border: Border.all(color: Colors.transparent),
                color: Color.fromRGBO(64, 196, 189, 0.767),
                borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.only(top: 15),
          ),
          tabs: [
            Text(
              "Calculator",
              style: Constants.text1,
            ),
            Text(
              "Exchange",
              style: Constants.text1,
            )
          ],
          views: [
            CalculatorScreen(),
            ExchangeScreen()
          ],
          onChange: (index) => print(index),
        ),
      ),
    );
  }
}