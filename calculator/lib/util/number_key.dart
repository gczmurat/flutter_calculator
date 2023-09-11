import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NumberKey extends StatelessWidget {
  final String child;
  final VoidCallback onTap;
  var buttonColor = Colors.transparent;
  var numColor = Colors.black;

  NumberKey({Key? key, required this.child, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (child == "/" ||
        child == "x" ||
        child == "-" ||
        child == "+" ||
        child == "=") {
      numColor = Color.fromRGBO(64, 196, 189, 0.767);
    }
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              child,
              style: TextStyle(
                color: numColor,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.ubuntu().fontFamily,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
