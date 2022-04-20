import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'select_date.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: backgroundReturnWeight(),
//     );
//   }
// }

class backgroundReturnWeight extends StatelessWidget {
  final user;
  final data;
  const backgroundReturnWeight(
      {Key? key, required this.user, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context) => Data(),
      child: Builder(builder: (context) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.black12,
            body: Stack(children: [
              Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                    gradient: RadialGradient(colors: [
                  const Color(0xff725a94).withOpacity(0.5),
                  Colors.transparent
                ])),
              ),
              Container(
                width: 200,
                height: 600,
                decoration: BoxDecoration(
                    gradient: RadialGradient(colors: [
                  Colors.lightBlue.withOpacity(0.5),
                  Colors.transparent
                ], center: const Alignment(-1.0, 0.7))),
              ),
              RunningPlan(
                data: data,
                user: user,
              )
            ]));
      }),
    );
  }
}

class RunningPlan extends StatefulWidget {
  final user;
  final data;
  RunningPlan({Key? key, required this.user, required this.data})
      : super(key: key);

  @override
  _RunningPlanState createState() => _RunningPlanState();
}

class _RunningPlanState extends State<RunningPlan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 70),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 60),
                    alignment: Alignment.center,
                    child: const Text("Weight Training",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
              Consumer<Data>(
                  builder: (_, Data, __) => Center(
                        child: runningoption(
                          data: widget.data,
                          user: widget.user,
                          WeightRep: Data.WeightRep,
                        ),
                      ))
            ],
          ),
        ],
      ),
    );
  }
}

class runningoption extends StatefulWidget {
  final data;
  final Map<dynamic, dynamic> WeightRep;
  final user;
  runningoption(
      {Key? key,
      required this.WeightRep,
      required this.user,
      required this.data})
      : super(key: key);

  @override
  _runningoptionState createState() => _runningoptionState();
}

class _runningoptionState extends State<runningoption> {
  var Plan_Weight1;
  var Plan_Weight2;
  var Plan_Weight3;
  var Plan_Weight4;
  var Plan_Weight5;

  var Plan_Rep1;
  var Plan_Rep2;
  var Plan_Rep3;
  var Plan_Rep4;
  var Plan_Rep5;

  @override
  void initState() {
    super.initState();
    Plan_Weight1 = widget.WeightRep[1]["Weights"];
    Plan_Weight2 = widget.WeightRep[2]["Weights"];
    Plan_Weight3 = widget.WeightRep[3]["Weights"];
    Plan_Weight4 = widget.WeightRep[4]["Weights"];
    Plan_Weight5 = widget.WeightRep[5]["Weights"];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 350,
          height: 500,
          margin: const EdgeInsets.only(bottom: 20, top: 70),
          decoration: BoxDecoration(
              color: const Color(0xff7B8794).withOpacity(0.5),
              border: Border.all(color: Colors.transparent),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: const Text(
                      " ",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 80),
                    child: const Text(
                      "Weight",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 30),
                    child: const Text(
                      "Repetitions",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 40),
                      child: const Text("1",
                          style: TextStyle(
                              fontSize: 25,
                              color: Color(0xffE5E5E5),
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 40),
                      child: InputWeight(
                        info: Plan_Weight1,
                        indexName: "Weights",
                        index: 1,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 60),
                      child: InputWeight(
                        indexName: "Repetition",
                        info: Plan_Rep1,
                        index: 1,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 40),
                      child: const Text("2",
                          style: TextStyle(
                              fontSize: 25,
                              color: Color(0xffE5E5E5),
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 40),
                      child: InputWeight(
                        indexName: "Weights",
                        info: Plan_Weight2,
                        index: 2,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 60),
                      child: InputWeight(
                        indexName: "Repetition",
                        info: Plan_Rep2,
                        index: 2,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 45),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 40),
                      child: const Text("3",
                          style: TextStyle(
                              fontSize: 25,
                              color: Color(0xffE5E5E5),
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 40),
                      child: InputWeight(
                        indexName: "Weights",
                        info: Plan_Weight3,
                        index: 3,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 60),
                      child: InputWeight(
                        indexName: "Repetition",
                        info: Plan_Rep3,
                        index: 3,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 45),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 40),
                      child: const Text("4",
                          style: TextStyle(
                              fontSize: 25,
                              color: Color(0xffE5E5E5),
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 40),
                      child: InputWeight(
                        indexName: "Weights",
                        info: Plan_Weight4,
                        index: 4,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 60),
                      child: InputWeight(
                        indexName: "Repetition",
                        info: Plan_Rep1,
                        index: 4,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 45),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 40),
                      child: const Text("5",
                          style: TextStyle(
                              fontSize: 25,
                              color: Color(0xffE5E5E5),
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 40),
                      child: InputWeight(
                        indexName: "Weights",
                        info: Plan_Weight5,
                        index: 5,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 60),
                      child: InputWeight(
                        indexName: "Repetition",
                        info: Plan_Rep5,
                        index: 5,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Consumer<Data>(
          builder: (_, Data, __) => TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xffEF5DA8)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(color: Color(0xffEF5DA8)),
                  ))),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return nameAndRepeat(
                        data: widget.data,
                        user: widget.user,
                        type: "Weight Trainning",
                        factor1: Data.WeightRep,
                        factor2: [0],
                      );
                    });
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                width: 270,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Set Your goals",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              )),
        )
      ],
    );
  }
}

class InputWeight extends StatefulWidget {
  var info;
  int index;
  String indexName;

  InputWeight(
      {Key? key,
      required this.info,
      required this.index,
      required this.indexName})
      : super(key: key);

  @override
  _InputWeightState createState() => _InputWeightState();
}

class _InputWeightState extends State<InputWeight> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

//TODO Make val in line 398 send value to widget.info
  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(
      builder: (_, Data, __) => Container(
        decoration: const BoxDecoration(
            color: Color(0xffff455a64),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        height: 40,
        width: 70,
        child: TextField(
          controller: myController,
          textAlign: TextAlign.center,
          onChanged: (val) {
            Data.changingRunDistance("$val", widget.index, widget.indexName);
            widget.info = val;
          },
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: '0',
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class Data extends ChangeNotifier {
  Map<dynamic, dynamic> WeightRep = {
    1: {"Weights": "0", "Repetition": "0"},
    2: {"Weights": "0", "Repetition": "0"},
    3: {"Weights": "0", "Repetition": "0"},
    4: {"Weights": "0", "Repetition": "0"},
    5: {"Weights": "0", "Repetition": "0"},
  };
  void changingRunDistance(String newValue, int index, String indexName) {
    WeightRep[index][indexName] = newValue;
    notifyListeners();
  }
}
