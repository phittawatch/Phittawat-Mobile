import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:excercise9_problem3/main.dart';
import 'screen3.dart';
import 'home.dart';
import 'restart.dart';

void main() {
  runApp(MaterialApp(home:MyApp2()));
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
          _showDialog(context);}
        else{
          _showMissDialog(context);
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
            Text("Where is this", style: TextStyle(fontSize: 25, color: Colors.pink),),
            Image(image: NetworkImage(widget.image), height: 200, width: 300),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(child: ParentWidget(u_name: widget.choice1, show_color: Colors.blueAccent, check: false,
                  ),),
                  Expanded(child: ParentWidget(u_name: widget.choice2, show_color: Colors.orangeAccent,  check: false
                  ),),
                ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(child: ParentWidget(u_name: widget.choice3, show_color: Colors.yellowAccent, check: true
                ),),
                Expanded(child: ParentWidget(u_name: widget.choice4, show_color: Colors.amberAccent, check: false
                ),),
              ],),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(//margin: EdgeInsets.only(left: 15, right: 15),
                  child:
                ElevatedButton(
                    child: const Text('PREVIOUS'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyApp()));
                    }),

                ),
                Container( //margin: const EdgeInsets.only(left: 120.0),
                    child: ElevatedButton(
                        child: const Text('HOME'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Homie()));
                        })),
                Container(child:
                ElevatedButton(
                    child: const Text('NEXT'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyApp3()));
                    }),

                )
              ],

              )
          ],)));
  }
}

class Navigation_route extends StatefulWidget {
  const Navigation_route({Key? key}) : super(key: key);

  @override
  _Navigation_routeState createState() => _Navigation_routeState();
}

class _Navigation_routeState extends State<Navigation_route> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
    Container(child:
    ElevatedButton(
        child: const Text('PREVIOUS'),
    onPressed: () {

    }),

    ),
    Container(child:
    ElevatedButton(
    child: const Text('NEXT'),
    onPressed: () {

    }),

    )
      ],
    );
  }
}

void _showDialog(BuildContext context){
  showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text("Score!"),
          content: const Text("Congrats! You have 1 point!"),
          actions: <Widget>[
            ElevatedButton(
                child: const Text("OK"),
                onPressed:(){
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp3()));
                }
            )],
        );});
}

void _showMissDialog(BuildContext context){
  showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text("Score!"),
          content: const Text("Sorry! You miss it!"),
          actions: <Widget>[
            ElevatedButton(
                child: const Text("OK"),
                onPressed:(){
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Restart()));
                }
            )],
        );});
}


class MyApp2 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:'My Pet App',
      home: Scaffold(
        appBar: MediaQuery.of(context).orientation  == Orientation.landscape
            ? null
            : AppBar(
          title: const Text('Question 2'), backgroundColor: Colors.blue,
        ),
        body:Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:const <Widget>[
              LayoutFlutter('https://i0.wp.com/www.kku.ac.th/wp-content/uploads/2019/05/kku-768x432.jpg', 'CU',
                  "CMU", "KKU", "MU"),
            ],
          ),
        ),
      ),
    );
  }
}
