import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.onAction});

  final Function(String value) onAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-cover.png',
            width: 300,
          ),
          const Text(
            'Let\'s do some Refresments on Flutter',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 35,
              color: Colors.white,
            ),
          ),
          OutlinedButton(
            onPressed: () {
              onAction('quiz');
            },
            child: const Text('Start Quiz'),
          )
        ],
      ),
    );
  }
}
