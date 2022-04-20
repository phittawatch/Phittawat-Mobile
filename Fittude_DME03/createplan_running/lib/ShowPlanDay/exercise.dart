import 'package:flutter/material.dart';
import 'call_exercise_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'write_plan_finish.dart';

// void main() {
//   runApp(ExercisePage());
// }
class ExercisePage extends StatefulWidget {
  final user;
  final data;
  ExercisePage({Key? key, required this.data, required this.user})
      : super(key: key);

  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      //appBar: AppBar(),
      body: Stack(
        children: [
          //Background_Image(),
          // Container(
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //         image: ExactAssetImage("assets/images/weightPlan.jpg"),
          //         fit: BoxFit.cover),
          //   ),
          // ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment(0, 0),
              colors: [
                Colors.black.withOpacity(0.4),
                Colors.transparent,
              ],
            )),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment(0, 0),
              colors: [
                Colors.black.withOpacity(0.4),
                Colors.transparent,
              ],
            )),
          ),
          step(
            user: widget.user,
            maxstep: widget.data[0]['Training'].length,
            data: widget.data,
          )
        ],
      ),
    );
  }
}

class AlertCon extends StatelessWidget {
  final _database = FirebaseDatabase.instance.reference();
  final data;
  final PreContext;
  final user;
  DateTime _selectedValue = DateTime.now();

  AlertCon(
      {Key? key,
      required this.data,
      required this.user,
      required this.PreContext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _dayname = DateFormat('EEEE').format(_selectedValue);
    final SetFinish =
        _database.child('user/${user.displayName}/Plan/0/History');
    SetFinish.update({_selectedValue.toString().split(' ')[0]: "Done"})
        .then((_) => print("Special of the day has been written"))
        .catchError((error) => print("You get an error! $error"));
    debugPrint('${_selectedValue.toString().split(' ')[0]}');

    for (var i = 0; data[0]['Training'].length > i; i++) {
      final SetFinish = _database
          .child('user/${user.displayName}/Plan/0/Training/$i/Train/Repeat/');
      SetFinish.update({'$_dayname': 'True'})
          .then((_) => print("Special of the day has been written"))
          .catchError((error) => print("You get an error! $error"));
    }

    // WriteExample(
    //   user: user,
    //   dayname: _dayname,
    // );
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(children: [
          Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  const Color(0xff725a94).withOpacity(0.5),
                  Colors.black45
                ],
                center: const Alignment(1.0, 0),
              ),
            ),
          ),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [Colors.lightBlue.withOpacity(0.5), Colors.black45],
                center: const Alignment(-1.0, -1.0),
              ),
            ),
          ),
          Container(
            width: 200,
            height: 600,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  const Color(0xffa6789e).withOpacity(0.5),
                  Colors.black45
                ],
                center: const Alignment(-1.2, 0.7),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.all(15),
                    child: const Text(
                      "You have done exercise for this day!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )),
                TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.pinkAccent),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(color: Colors.pinkAccent),
                        ))),
                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => CallingExercisePage(
                      //         data: data,
                      //       ),
                      //     ));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      width: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Go to Homepage",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          )
        ]));
  }
}

class step extends StatefulWidget {
  step(
      {Key? key, required this.maxstep, required this.data, required this.user})
      : super(key: key);
  final maxstep;
  final data;
  final user;
  //var maxsteps = maxstep[0]['Training'].length;
  @override
  _stepState createState() => _stepState();
}

class _stepState extends State<step> {
  var _step = 1;
  var _step_check = 1;
  Widget Background_Image() {
    return Image(
      image: AssetImage('./assets/images/weightPlan.jpg'),
    );
  }

  void tapnext() {
    setState(() {
      if (_step == widget.maxstep) {
        _step = widget.maxstep;
        _step_check += 1;
      } else {
        _step += 1;
        _step_check += 1;
      }
    });
  }

  void tapback() {
    setState(() {
      if (_step == 1) {
        _step = 1;
        _step_check = 1;
      } else {
        _step -= 1;
        _step_check -= 1;
      }
    });
  }

  // Widget DonePlan(user, step, maxstep, data, context) {
  //   debugPrint("????");
  //   if (step > maxstep) {
  //     debugPrint("True");
  //
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => AlertCon(
  //             user: user,
  //             PreContext: context,
  //             data: data,
  //           ),
  //         ));
  //     return Container();
  //   } else {
  //     return Container();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        exercise(widget.data, _step),
        Container(
          width: 300,
          height: 400,
          margin: EdgeInsets.only(bottom: 20, top: 20),
          decoration: BoxDecoration(
              color: Colors.black87.withOpacity(0),
              border: Border.all(color: Colors.transparent),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
        ),
        Text("Round $_step/${widget.maxstep}",
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 25)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.pinkAccent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(color: Colors.pinkAccent),
                    ))),
                onPressed: () {
                  tapback();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AlertCon(
                          user: widget.user,
                          PreContext: context,
                          data: widget.data,
                        ),
                      ));
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Finish All",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                )),
            TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.pinkAccent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(color: Colors.pinkAccent),
                    ))),
                onPressed: () {
                  debugPrint('$_step_check');
                  tapnext();
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  width: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Next Step",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                      )
                    ],
                  ),
                )),
          ],
        )
      ],
    );
  }
}

class exercise extends StatefulWidget {
  exercise(this.title, this.step);
  final title;
  final int step;
  @override
  State<exercise> createState() => _exerciseState();
}

Widget CheckType(data, step) {
  step = step - 1;
  //int steps = step;
  //debugPrint(step);
  //var StepOfExercise = data[0]['Training'][0];
  if (data[0]['Training'][step]['type'] == "Weight Trainning") {
    var Data1 = data[0]['Training'][step]['Train']['Weight'];
    var Data2 = data[0]['Training'][step]['Train']['Rep'];
    return Listview_Weight(Data1, Data2);
  }
  if (data[0]['Training'][step]['type'] == "Running") {
    var Data1 = data[0]['Training'][step]['Train']['Pace'];
    var Data2 = data[0]['Training'][step]['Train']['Distance'];
    return Listview_Runing(Data1, Data2);
  }
  return Container(
    child: Text(
      "${data[0]['Training'][step]['Train']['Distance']}",
      style: TextStyle(color: Colors.white),
    ),
  );
}

Widget Listview_Weight(Data1, Data2) {
  List weight_display = ["Weight"];
  List Rep_display = ["Rep"];
  return Container(
    decoration: BoxDecoration(
        color: Colors.black87,
        border: Border.all(color: Colors.black87),
        borderRadius: const BorderRadius.all(Radius.circular(10))),
    padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
    height: 90,
    child: ListView.builder(
        itemCount: Data1.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var new_weight = new List.from(weight_display)..addAll(Data1);
          var new_rep = new List.from(Rep_display)..addAll(Data2);
          var num = new_weight[index];
          var num2 = new_rep[index];
          return Row(
            children: [
              Column(
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        "$num",
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      )),
                  Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: Text("$num2",
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w700)))
                ],
              )
            ],
          );
        }),
  );
}

Widget Listview_Runing(Data1, Data2) {
  List weight_display = ["Weight"];
  List Rep_display = ["Rep"];

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
          padding:
              const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
          height: 90,
          decoration: const BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            children: [
              Text(
                'Pace',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text('${Data1.toStringAsFixed(2)}',
                  style: TextStyle(color: Colors.white, fontSize: 20))
            ],
          )),
      Container(
        padding:
            const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
        height: 90,
        decoration: const BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [
            Text(
              'Distance(km)',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text('${Data2.toStringAsFixed(2)}',
                style: TextStyle(color: Colors.white, fontSize: 20))
          ],
        ),
      )
    ],
  );
}

class _exerciseState extends State<exercise> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 40),
          child: Stack(
            children: <Widget>[
              Row(
                children: [
                  IconButton(
                    alignment: Alignment.bottomLeft,
                    icon: Icon(Icons.arrow_back_ios_rounded),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(left: 25),
                      child: Text(widget.title[0]['PlanName'],
                          style: const TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.w700)),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Container(
          child: CheckType(widget.title, widget.step),
        )
      ],
    );
  }
}
