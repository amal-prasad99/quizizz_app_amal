import 'package:flutter/material.dart';
import 'package:q_a_app_v02/answer_button.dart';
import 'package:q_a_app_v02/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(
      {super.key, required this.onAnswer, required this.onAction});

  final Function(String value) onAction;
  final Function(String value) onAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    setState(() {
      widget.onAnswer(answer);
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questions[currentQuestionIndex].question,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 35,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ...questions[currentQuestionIndex].getRandomAnswers().map(
                  (answer) =>
                      AnswerButton(value: answer, onAnswer: answerQuestion),
                ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {
                  widget.onAction('start');
                },
                child: const Text(
                  'Back to Start',
                  style: TextStyle(fontSize: 20, color: Colors.amber),
                ))
          ],
        ),
      ),
    );
  }
}
