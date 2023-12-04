import 'package:flutter/material.dart';
import 'package:q_a_app_v02/data/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.answerList, required this.onAction});

  final List<String> answerList;
  final Function(String value) onAction;

  List<Map<String, Object>> getSummary() {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < answerList.length; i++) {
      summary.add({
        'questionIndex': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': answerList[i],
      });
    }
    return summary;
  }

  int getCorectAnswerCount(List<Map<String, Object>> questions) {
    int count = 0;
    for (var i = 0; i < answerList.length - 1; i++) {
      if (answerList[i].toString() ==
          questions[i]['correct_answer'].toString()) {
        count++;
      }
    }
    return count;
  }

  Widget buildCard(Map<String, Object> s) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Text(
                "Question " + ((s['questionIndex'] as int) + 1).toString(),
                style: const TextStyle(
                    fontSize: 30, color: Color.fromARGB(255, 1, 54, 97)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                (s['question']).toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 15, color: Color.fromARGB(255, 189, 142, 0)),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Correct Answer",
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 1, 54, 97),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                (s['correct_answer']).toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 15, color: Color.fromARGB(255, 5, 95, 9)),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Your Answer",
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 1, 54, 97),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                s['user_answer'].toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 15, color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> summary = getSummary();
    int count = getCorectAnswerCount(summary);

    return ListView(
      children: [
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Result Screen',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Correct : $count / 10',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(
                height: 30,
              ),
              ...getSummary().map((s) => buildCard(s)),
              OutlinedButton(
                onPressed: () {
                  onAction('start');
                },
                child: const Text('Restart'),
              )
            ],
          ),
        ),
      ],
    );
  }
}
