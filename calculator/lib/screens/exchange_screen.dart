import 'package:calculator/model/money_api.dart';
import 'package:calculator/model/money_model.dart';
import 'package:calculator/util/excance_view.dart';
import 'package:calculator/util/number_key.dart';
import 'package:flutter/material.dart';

class ExchangeScreen extends StatefulWidget {
  const ExchangeScreen({super.key});

  @override
  State<ExchangeScreen> createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen> {
  late Future<List<ExcangeRate>> _excangeListFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _excangeListFuture = MoneyApi.getExchangeModel();
  }
  List<String> numberPad = [
    "7",
    "8",
    "9",
    "C",
    "4",
    "5",
    "6",
    "",
    "1",
    "2",
    "3",
    "",
    "0",
    "00",
    ",",
    "DEL"
  ];
  String currency = "1";

  void buttonTapped(String button) {
    setState(() {
      if (button == "C") {
        currency = "1";
      } else if (button == "DEL") {
        if (currency.isNotEmpty) {
          currency = currency.substring(
              0, currency.length - 1);
        }
      } else {
        currency += button;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: _excangeListFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    List<ExcangeRate> _listem = snapshot.data!;
                    return ExcanceView(userCurrency: currency,);
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text("Hata Çıktı"),
                    );
                  }
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                color: const Color.fromRGBO(237, 253, 252, 1),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: numberPad.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
