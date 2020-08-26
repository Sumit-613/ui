import 'package:firebaselogin/screens/login_screen.dart';
import 'package:firebaselogin/screens/landingPage.dart';
import 'package:firebaselogin/services/auth.dart';
import 'package:flutter/material.dart';
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      appBar:AppBar(
        centerTitle: true,
        title: Text('Time Tracker'),
        backgroundColor: Colors.lightBlue[900],),
      body: LandingPage(authBase: Auth(),
      ),),);
  }
}
