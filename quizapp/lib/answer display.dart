import 'package:flutter/material.dart';
import './question_display.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerDisplay extends StatelessWidget {
  const AnswerDisplay(this.itemselected, {super.key});

  final Map<String, Object> itemselected;

  Widget build(context) {
    final iscorrect =
        itemselected['correct_answer'] == itemselected['user_answer'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Qdisplay(
            questionIndex: (itemselected['question_index'] as int),
            isAnswercorrect: iscorrect),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemselected['question'] as String,
                style: GoogleFonts.albertSans(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                ("User answer: ") + (itemselected['user_answer'] as String),
                textAlign: TextAlign.center,
                style: GoogleFonts.albertSans(
                  color: Colors.white,
                  //fontSize: 10,
                  //fontWeight: FontWeight.bold,
                  //fontStyle: FontStyle.italic
                ),
              ),
              Text(
                ("Correct answer: ") +
                    (itemselected['correct_answer'] as String),
                style: GoogleFonts.albertSans(
                  color: Colors.white,
                  //fontSize: 10,
                  //fontWeight: FontWeight.bold,
                  //fontStyle: FontStyle.italic
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ],
    );
  }
}
