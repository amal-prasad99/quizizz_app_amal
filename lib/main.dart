import 'package:flutter/material.dart';
import 'package:q_a_app_v02/data/questions.dart';
import 'package:q_a_app_v02/quiz.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await readJson();
  runApp(const Quiz());
}
