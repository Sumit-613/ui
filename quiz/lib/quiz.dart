//quiz.dart
import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;

  final Function answerQuestion;

  Quiz({
    @required this.questions,
    //hold the questions
    @required this.answerQuestion,
    // holds _answerQuestion function
    @required this.questionIndex,
    //holds _questionIndex
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'],
          //fetch the questionText of questions at position questionIndex
        ),
        //Allow you to create n no of answer having n answer options
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
          //Answer() of answer.dart has answerQuestion(answer['score']) and answer['text'] as parameters
        }).toList()
      ],
    );
  }
}