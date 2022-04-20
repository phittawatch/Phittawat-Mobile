import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class WriteExample extends StatefulWidget {
  const WriteExample({Key? key}) : super(key: key);

  @override
  State<WriteExample> createState() => _WriteExampleState();
}

class _WriteExampleState extends State<WriteExample> {
  final database = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    final dailySpecialRef = database.child('dailySpecial/');
    final _database = FirebaseDatabase.instance.reference();
    return Scaffold(
      appBar: AppBar(title: Text("Write Page")),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                final SetFinish = _database.child(
                    'user/Patharadach maneewong/Plan/0/Training/0/Train/Repeat/');
                SetFinish.update({'Friday': 'True'})
                    .then((_) => print("Special of the day has been written"))
                    .catchError((error) => print("You get an error! $error"));
                dailySpecialRef
                    .set({'description': 'Vanilla latte', 'price': 5.66})
                    .then((_) => print("Special of the day has been written"))
                    .catchError((error) => print("You get an error! $error"));
              },
              child: Text("Simple set"))
        ],
      ),
    );
  }
}
