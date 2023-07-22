import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Qdisplay extends StatelessWidget {
  Qdisplay(
      {super.key, required this.questionIndex, required this.isAnswercorrect});

  final int questionIndex;
  final bool isAnswercorrect;

  @override
  Widget build(context) {
    int questionNumber = questionIndex + 1;

    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: isAnswercorrect ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(80)),
      child: Text(
        questionNumber.toString(),
        style: GoogleFonts.acme(
          color: const Color.fromARGB(255, 71, 7, 83),
          fontSize: 15,
        ),
      ),
    );
  }
}
