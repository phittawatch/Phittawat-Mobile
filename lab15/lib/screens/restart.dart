import 'package:excercise9_problem3/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MaterialApp(home:Restart()));
}

class Restart extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:'My Pet App',
      home: Scaffold(
        body:Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Text("Your total score is ${score_count}", style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),),
            ElevatedButton(
              child: const Text('RESTART'),
              onPressed: () {
                score_count = 0;
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Homie()));
              })],)),
          ),
        );
  }
}
