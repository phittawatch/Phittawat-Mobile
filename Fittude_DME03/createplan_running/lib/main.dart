import 'package:flutter/material.dart';
import 'running_training.dart';
import 'wieght_training.dart';
import 'Login/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'read_example.dart';
import 'write_example.dart';
import 'package:firebase_database/firebase_database.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OpenCreatePlan(),
    );
  }
}

class OpenCreatePlan extends StatelessWidget {
  const OpenCreatePlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => backgroundReturn()));
                },
                child: Text("Running plan")),
          ),
          Center(
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => backgroundReturnWeight()));
                },
                child: Text("Weight plan")),
          ),
          Center(
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignInProviderGate()));
                },
                child: Text("Login")),
          ),
          Column(
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
        ],
      ),
    );
  }
}
