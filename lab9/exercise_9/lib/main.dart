import 'package:flutter/material.dart';
import 'package:exercise_9/app_screens/long_list.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Basic List View Demo",
    home: Fab(),
  ));
}

class Fab extends StatefulWidget {
  const Fab({Key? key}) : super(key: key);

  @override
  _FabState createState() => _FabState();
}
class _FabState extends State<Fab> {
  int i = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: Colors.green,
          onPressed: (){
            ScaffoldMessenger.of(context).
            showSnackBar(SnackBar(content: Text("Current number of problem is  ${i+1}")));
            setState(() {
              i++;
            });
          },
        ),
        appBar: AppBar(
          title: const Text("Widgets Exercise"),
        ),
        body: getListView(i)

    );
  }
}

