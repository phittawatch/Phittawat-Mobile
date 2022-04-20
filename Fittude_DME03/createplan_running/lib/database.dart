import 'package:flutter/material.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'read_example.dart';
import 'write_example.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_database/firebase_database.dart';

Future<void> main() {
  await Firebase.initializeApp();
  runApp(MyApp());
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //use MaterialApp() widget like this
        home: HomepageDB() //create new widget class for this 'home' to
        // escape 'No MediaQuery widget found' error
        );
  }
}

//create new class for "home" property of MaterialApp()
class HomepageDB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Main"),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Example"),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReadExample(),
                      ));
                },
                child: Text("Read Example"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WriteExample(),
                      ));
                },
                child: Text("Write Example"),
              ),
            ],
          ),
        ));
  }
}
