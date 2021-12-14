import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  int mark;
  VoidCallback resetQuiz;
  List<DataRow> user_ans_and_correct_ans = [];
  Result(this.mark, this.user_ans_and_correct_ans, this.resetQuiz);
  State<StatefulWidget> createState() {
    return _Result(mark, user_ans_and_correct_ans, this.resetQuiz);
  }
}

class _Result extends State<Result> {
  int mark;
  VoidCallback resetQuiz;
  List<DataRow> user_ans_and_correct_ans = [];
  _Result(this.mark, this.user_ans_and_correct_ans, this.resetQuiz);
  DataColumn tableHeader(title) {
    return DataColumn(
        label: Text(title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)));
  }

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(2.0),
              // color: Colors.blueAccent,
              child: Text(
                "Your Obtained Mark: " + '$mark',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              )),
          DataTable(
            columns: [
              tableHeader("Questin ID"),
              tableHeader("Your Answers"),
              tableHeader("Correct Answers"),
            ],
            rows: user_ans_and_correct_ans,
          ),
          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(2.0),
            color: Colors.green,
            child: FlatButton(
              child: Text(
                "Start Again",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              onPressed: resetQuiz,
            ),
          ),
        ],
      ),
    );
  }
}
