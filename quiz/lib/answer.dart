import 'package:flutter/material.dart';
class Answer extends StatelessWidget {
  final Function selectHandler;
  //selectHandler holds Answer()
  final String answerText;
  //answerText holds answer['text'] from quiz.dart
  Answer(this.selectHandler,this.answerText);
  @override
  Widget build(BuildContext context) {
    return Container(width: double.infinity,

      child:RaisedButton(color:Colors.blue,child: Text(answerText),onPressed:()=>selectHandler(),),
    );
  }
}
