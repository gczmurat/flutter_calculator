import 'package:calculator/util/number_key.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CanculatorScreenState();
}

class _CanculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    List numberPad = [
      "C",
      "%",
      "DEL",
      "/",
      "7",
      "8",
      "9",
      "X",
      "4",
      "5",
      "6",
      "-",
      "1",
      "2",
      "3",
      "+",
      "0",
      "00",
      ",",
      "="
    ];

    double calculateResult = 0;

    void buttonTapped(String button){
      
    }

    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
            color: Colors.white,
          )),
          Expanded(
              flex: 2,
              child: Container(
                color: Color.fromRGBO(237, 253, 252, 1),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: numberPad.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      return NumberKey(
                        onTap: () => buttonTapped(numberPad[index]),
                        child: numberPad[index],
                      );
                    },
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
