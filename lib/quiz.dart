import 'package:flutter/material.dart';
import 'package:q_a_app_v02/data/questions.dart';
import 'package:q_a_app_v02/question_screen.dart';
import 'package:q_a_app_v02/result_screen.dart';
import 'package:q_a_app_v02/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = StartScreen(
  //     onAction: onScreenChange,
  //   );
  //   super.initState();
  // }

  List<String> selectedAnswwer = [];

  String activeScreen = 'start';

  void onScreenChange(String value) {
    setState(() {
      activeScreen = value;
    });
  }

  void onAnswerSelect(String answer) {
    selectedAnswwer.add(answer);
    if (selectedAnswwer.length == questions.length) {
      setState(() {
        activeScreen = 'result';
      });
    }
  }

  void onRestart(String value) {
    setState(() {
      selectedAnswwer = [];
      activeScreen = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget? currentScreen = StartScreen(onAction: onScreenChange);

    if (activeScreen == 'start') {
      currentScreen = StartScreen(onAction: onScreenChange);
    }
    if (activeScreen == 'quiz') {
      currentScreen = QuestionScreen(
        onAction: onScreenChange,
        onAnswer: onAnswerSelect,
      );
    }
    if (activeScreen == 'result') {
      currentScreen =
          ResultScreen(onAction: onRestart, answerList: selectedAnswwer);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: currentScreen,
        ),
      ),
    );
  }
}
