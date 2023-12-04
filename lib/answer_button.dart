import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.value, required this.onAnswer});

  final String value;
  final Function(String value) onAnswer;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onAnswer(value);
      },
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Colors.green),
      child: Text(
        value,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }
}
