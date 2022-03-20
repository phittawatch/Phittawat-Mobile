import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screen2.dart';
import 'package:excercise9_problem3/main.dart';

void main() {
  runApp(MaterialApp(home:Homie()));
}

class ParentWidget extends StatefulWidget{
  const ParentWidget({Key? key, required this.u_name, required this.show_color, required this.check}): super(key: key);

  final String u_name;
  final Color show_color;
  final bool check;

  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget>{
  Color correct = Colors.green;
  bool _active = false;

  void _handleTapboxChanged(){
    setState(() {
      if (widget.check == false){
        correct = Colors.red;
        SnackBar(
            content: const Text('Yay! A SnackBar!'));
      }
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      child: Container(
        width: 150,
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(color: _active ? correct : widget.show_color),
        child: Text(widget.u_name, style: TextStyle(fontSize: 18), textAlign: TextAlign.center),),
      onTap:(){
        _handleTapboxChanged();
        if (widget.check == true){
          final snackBar = SnackBar(
              content: const Text('Your score is 1'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);}
        else{
          final snackBar = SnackBar(
              content: const Text('Your score is 0'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
    );
  }
}

class LayoutFlutter extends StatefulWidget {

  final String choice1;
  final String choice2;
  final String choice3;
  final String choice4;
  final String image;
  const LayoutFlutter(this.image, this.choice1, this.choice2, this.choice3, this.choice4);

  @override
  _LayoutFlutterState createState() => _LayoutFlutterState();

}


class _LayoutFlutterState extends State<LayoutFlutter> {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      //margin: const EdgeInsets.only(bottom: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(image: NetworkImage(widget.image), height: 200, width: 300),
            Text("Welcome to Quiz App", style: TextStyle(fontSize: 25, color: Colors.black54, fontWeight: FontWeight.bold),),
            Text("By Phittawat Champajan 623040194-5", style: TextStyle(fontSize: 14, color: Colors.pink),),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(//margin: const EdgeInsets.only(left: 65.0),
                  child:
                  ElevatedButton(
                      child: const Text('Start'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyApp()));
                      }),

                ),
              ],

            )
          ],)));
  }
}


class Homie extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:'My Pet App',
      home: Scaffold(
        body:Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:const <Widget>[
              LayoutFlutter('https://www.drppt.org/wp-content/uploads/QUIZ-3D.png', 'Bangkok',
                  "Khon Kaen", "Chaing Mai", "Phuket"),
            ],
          ),
        ),
      ),
    );
  }
}
