import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final String name;

  const Result({super.key, required this.totalScore, required this.name});
  String get resultPhrase {
    String resultText;
    if (totalScore <= 15) {
      resultText = 'You choose better';
    } else if (totalScore <= 25) {
      resultText = 'You have completed the evaluation';
    } else if (totalScore <= 35) {
      resultText = 'You have successfully completed the evaluation.';
    } else {
      resultText = 'Awsome!!! You are the Best';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('asset/1393652.jpg'), fit: BoxFit.cover),
      ),
      child: Center(
        child: Text(
          '${'Hey $name'.toUpperCase()}\n\n$resultPhrase',
          style: const TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 10, 2, 3)),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
