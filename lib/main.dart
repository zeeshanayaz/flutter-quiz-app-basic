import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  var _questions = [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 5},
        {'text': 'Snake', 'score': 3},
        {'text': 'Elephant', 'score': 4},
        {'text': 'Lion', 'score': 8}
      ],
    },
    {
      'questionText': 'Who is your favourite instructor?',
      'answers': [
        {'text': 'Max', 'score': 5},
        {'text': 'Max', 'score': 4},
        {'text': 'Max', 'score': 6}
      ],
    },
  ];
  void _answerFunction(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
      // if (_questionIndex < _questions.length - 1) _questionIndex++;
    });
    if (_questionIndex < _questions.length) {
      print("We have more questions");
    } else {
      print("No more questions");
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "My First App",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerFunction)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
