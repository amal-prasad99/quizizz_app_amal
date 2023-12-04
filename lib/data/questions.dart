import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:q_a_app_v02/models/quiz_question.dart';

List<QuizQuestion> questions = [];

Future<void> readJson() async {
  final String responce =
      await rootBundle.loadString('assets/questionss_list.json');
  final List<dynamic> data = await json.decode(responce);

  //Adding the data from json to the qeustions list
  questions = data
      .map((data) => QuizQuestion(
            data['question'] as String,
            List<String>.from(data['options']),
          ))
      .toList();
}


// final List<QuizQuestion> questions = [
//   QuizQuestion(
//     'What are the main building blocks of Flutter UIs?',
//     [
//       'Widgets',
//       'Components',
//       'Blocks',
//       'Functions',
//     ],
//   ),
//   QuizQuestion('How are Flutter UIs built?', [
//     'By combining widgets in code',
//     'By combining widgets in a visual editor',
//     'By defining widgets in config files',
//     'By using XCode for iOS and Android Studio for Android',
//   ]),
//   QuizQuestion(
//     'Whats the purpose of a StatefulWidget?',
//     [
//       'Update UI as data changes',
//       'Update data as UI changes',
//       'Ignore data changes',
//       'Render UI that does not depend on data',
//     ],
//   ),
//   QuizQuestion(
//     'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
//     [
//       'StatelessWidget',
//       'StatefulWidget',
//       'Both are equally good',
//       'None of the above',
//     ],
//   ),
//   QuizQuestion(
//     'What happens if you change data in a StatelessWidget?',
//     [
//       'The UI is not updated',
//       'The UI is updated',
//       'The closest StatefulWidget is updated',
//       'Any nested StatefulWidgets are updated',
//     ],
//   ),
//   QuizQuestion(
//     'How should you update data inside of StatefulWidgets?',
//     [
//       'By calling setState()',
//       'By calling updateData()',
//       'By calling updateUI()',
//       'By calling updateState()',
//     ],
//   ),
// ];
