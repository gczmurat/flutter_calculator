import 'package:calculator/constants/app_constants.dart';
import 'package:calculator/util/number_key.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  var userQuestion = "";
  var userAnswer = "";
  List<String> numberPad = [
    "C",
    "%",
    "DEL",
    "/",
    "7",
    "8",
    "9",
    "x",
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

  void buttonTapped(String button) {
    setState(() {
      if (button == "C") {
        userQuestion = "";
        userAnswer = "";
      } else if (button == "DEL") {
        if (userQuestion.isNotEmpty) {
          userQuestion = userQuestion.substring(
              0, userQuestion.length - 1);
        }
      } else if (button == "=") {
        String finalQuestion = userQuestion;
        finalQuestion = finalQuestion.replaceAll("x", "*");
        Parser p = Parser();
        Expression exp = p.parse(finalQuestion);
        ContextModel cm = ContextModel();
        double eval = exp.evaluate(EvaluationType.REAL, cm);
        userAnswer = eval.toString();

      } else {
        userQuestion += button;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 12),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    userQuestion,
                    style: Constants.numberText,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 12, bottom: 20),
                  alignment: Alignment.centerRight,
                  child: Text(
                    userAnswer,
                    style: Constants.numberText,
                  ),
                )
              ],
            ),
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
