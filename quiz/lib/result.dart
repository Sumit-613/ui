//result.dart
import 'package:flutter/material.dart';
import 'dart:core';
class Result extends StatelessWidget {
  //resultScore to hold _totalscore passed in Result method in main.dart
  //resetHandler to hold _resetQuiz function passed in Result method in main.dart
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);
//resultScore =_totalscore,resetHandler= _resetQuiz
  //resultpharse hold the get the endresult of following part
  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You are awesome and innocent!';
    } else if (resultScore <= 12) {
      resultText = 'Pretty likeable!';
    } else if (resultScore <= 16) {
      resultText = 'You are ... strange?!';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            //think of flattbutton as clickable textfield
            child: Text(
              'Restart Quiz!',
            ),
            textColor: Colors.blue,
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}