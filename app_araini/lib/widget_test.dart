import 'package:app_araini/app_screens/PeteImageAsset.dart';
import 'package:app_araini/app_screens/Pete_button.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 10.0, top: 30.0, right: 10.0, bottom: 50),
        alignment: Alignment.center,
        color: Colors.yellowAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                children: const <Widget>[
                  Expanded(child:
                  Text("Phittawat Champajan",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent
                    ),
                  )),
                  Expanded(child:
                  Text(" 623040194-5",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent
                    ),
                  )
                  ),
                ],
              ),
              Row(
                children: const <Widget>[
                  Expanded(child:
                  Text("Photo Credit:",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlueAccent
                    ),
                  )),
                  Expanded(child:
                  Text("Meen DeadWish",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlueAccent
                    ),
                  )),
                ],
              ),
              const PeteImageAsset(),
              const PeteButton()
            ]
        ),
      ),
    );
  }
}