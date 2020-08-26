import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    backgroundColor: Colors.blue,
    appBar: AppBar(
      backgroundColor: Colors.blue,


      title: Center(child: Text('Askme ')),
    ),
        body: magicball8(),
  )));
}
class magicball8 extends StatefulWidget {

  @override
  _magicball8State createState() => _magicball8State();
}

class _magicball8State extends State<magicball8> {
  var ball=1;

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Center(child:  FlatButton(child: Image.asset('images/ball${ball}.png'),onPressed: (){setState(() {
       ball=Random().nextInt(6)+1;
      });}),)
    );
  }
}

