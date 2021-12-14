import 'package:flutter/material.dart';
import 'package:true_false_quiz/result.dart';

int main() {
  runApp(HomePage());
  return 0;
}

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz App",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text("Quiz App"),
          centerTitle: true,
        ),
        body: Quiz(),
      ),
    );
  }
}

class Quiz extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> questions = [
    '1. A NOR gate output is LOW if any of its inputs is LOW?',
    '2. A popular waveform generator is the Johnson shift counte?',
    '3. A NOR gate and an OR gate operate in exactly the same way.?',
    '4. A NOR gate output is LOW if any of its inputs is LOW?',
    '5. A popular waveform generator is the Johnson shift counte?',
    '6. A NOR gate and an OR gate operate in exactly the same way.?',
    '7. A NOR gate output is LOW if any of its inputs is LOW?',
    '8. A popular waveform generator is the Johnson shift counte?',
    '9. A NOR gate and an OR gate operate in exactly the same way.?',
    '10. A NOR gate output is LOW if any of its inputs is LOW?',
    '11. A popular waveform generator is the Johnson shift counte?',
    '12. A NOR gate and an OR gate operate in exactly the same way.?',
    
  ];
  List<bool> answers = [true, false, true, false, true, true, true, true, false,true, true, false];
  List<DataRow> user_ans_and_correct_ans = [];
  int idx = 0, mark = 0;

  DataColumn tableHeader(title) {
    return DataColumn(
        label: Text(title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)));
  }

  void resetQuiz() {
    setState(() {
      idx = 0;
    });
  }

  Widget answerStatus(title, user_ans) {
    return Container(
      margin: EdgeInsets.all(2.0),
      child: FlatButton(
        padding: EdgeInsets.all(20),
        color: user_ans ? Colors.green : Colors.redAccent,
        child: Text(
          title,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          if (user_ans == answers[idx]) mark++;
          user_ans_and_correct_ans.add(
            DataRow(cells: [
              DataCell(Text(idx.toString())),
              DataCell(Text(user_ans.toString())),
              DataCell(Text(answers[idx].toString())),
            ]),
          );
          idx++;
          setState(() {});
        },
      ),
    );
  }

  Widget build(BuildContext context) {
    return idx < questions.length
        ? Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.blue,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(2.0),
              alignment: Alignment.center,
              child: Text(questions[idx],
                  style:
                      TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
            ),
            answerStatus("True", true),
            answerStatus("False", false),
          ],
        )
        : SingleChildScrollView(
          child: Result(mark, user_ans_and_correct_ans, resetQuiz),
        );
  }
}
