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
          child: ElevatedButton(
              child: const Text('RESTART'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Homie()));
              })),
          ),
        );
  }
}
