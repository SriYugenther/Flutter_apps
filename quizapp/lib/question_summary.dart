import 'package:flutter/material.dart';

import './answer display.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return AnswerDisplay(data);
            },
          ).toList(),
        ),
      ),
    );
  }
}
//gft