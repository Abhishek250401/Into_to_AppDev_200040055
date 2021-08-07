import 'package:flutter/material.dart';
import 'package:appdev2/info/question.dart';



QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(
    MaterialApp(
    home:Scaffold(
      backgroundColor: Colors.grey[800],
      body:Quiz(),
    )
    )
  );
}
  class Quiz extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return SafeArea(
        child: Container(
          color: Colors.grey[800],
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: QuizPage(),
          ),
        ),
      );
    }
  }

  class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
  }

  class _QuizPageState extends State<QuizPage> {
  int  score=0;

  void checkAnswer(bool userPickedAnswer) {
  bool correctAnswer = quizBrain.getCorrectAnswer();
  setState(() {
    if (quizBrain.isFinished()) {
      Text("Your Score is $score");
      score=0;}
    if (userPickedAnswer == correctAnswer){
      score+=1;
    }

  quizBrain.getNextQuestion();

  });
  }
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Score:$score"),
      Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            quizBrain.getQuestion(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
        ),
      ),
    ),
    Expanded(
    child: Padding(
    padding: const EdgeInsets.all(15.0),
    child: Container(

    color: Colors.green,
    child:TextButton(
    onPressed: () {
    checkAnswer(true);
    },
    child: Text(
    'True',
    style: TextStyle(
    color: Colors.white,
    fontSize: 24.0,
    ),
    ),
    ),
    ),
    ),
    ),




    Expanded(
    child: Padding(
    padding: const EdgeInsets.all(15.0),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
      color: Colors.red,
      child:TextButton(


      onPressed: () {
      checkAnswer(false);
      },
      child: Text(
      'False',
      style: TextStyle(
      color: Colors.white,
      fontSize: 24.0,
      ),
      ),
      ),
      ),
    ),
    ),
    ),
    ]
    );


  }

  }
