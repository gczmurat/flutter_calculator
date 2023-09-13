import 'package:calculator/constants/app_constants.dart';
import 'package:flutter/material.dart';

class ExcanceView extends StatefulWidget {
  String userCurrency;
  ExcanceView({super.key, required this.userCurrency});

  @override
  State<ExcanceView> createState() => _ExcanceViewState();
}

class _ExcanceViewState extends State<ExcanceView> {
  String money1 = "USD";
  String money2 = "TL";
  String _url1 = "images/USD.png";
  String _url2 = "images/TL.png";
  void updateImageURL() {
    _url1 = "images/$money1.png";
    _url2 = "images/$money2.png";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 50,
            width: 350,
            child: Row(
              children: [
                Image.asset(
                  _url1,
                  height: 50,
                  width: 50,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 80, left: 20, top: 5, bottom: 3),
                    child: DropdownButtonFormField<String>(
                      value: money1,
                      onChanged: (value) {
                        setState(() {
                          money1 = value!;
                          updateImageURL();
                        });
                      },
                      items: ["USD", "TL", "EUR"]
                          .map((String value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              ))
                          .toList(),
                      dropdownColor: Colors.white,
                      decoration: InputDecoration(
                        labelText: 'Currency',
                        labelStyle: TextStyle(
                          color: money1 == "USD" ? Colors.black : Colors.black,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color:
                                money1 == "USD" ? Colors.black : Colors.black,
                            width: 2.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3.0),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(64, 196, 189, 0.767),
                              width: 1.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                    child: Center(
                      child: Text(
                        "1 USD",
                        style: Constants.numberText,
                      ),
                    ),
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            color: Color.fromRGBO(64, 196, 189, 0.767))))
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 50,
            width: 350,
            child: Row(
              children: [
                Image.asset(
                  _url2,
                  height: 50,
                  width: 50,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 80, left: 20, top: 5, bottom: 3),
                    child: DropdownButtonFormField<String>(
                      value: money2,
                      onChanged: (value) {
                        setState(() {
                          money2 = value!;
                          updateImageURL();
                        });
                      },
                      items: ["USD", "TL", "EUR"]
                          .map((String value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              ))
                          .toList(),
                      dropdownColor: Colors.white,
                      decoration: InputDecoration(
                        labelText: 'Currency',
                        labelStyle: TextStyle(
                          color: money2 == "USD" ? Colors.black : Colors.black,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color:
                                money2 == "USD" ? Colors.black : Colors.black,
                            width: 2.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3.0),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(64, 196, 189, 0.767),
                              width: 1.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                      child: Text(
                        "26,94 TL",
                        style: Constants.numberText,
                      ),
                    ),
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            color: Color.fromRGBO(64, 196, 189, 0.767))))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
