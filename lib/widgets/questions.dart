import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  const Question(this.questionText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        questionText,
        style: const TextStyle(
          color: Color.fromARGB(255, 39, 31, 1),
          fontSize: 25,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
