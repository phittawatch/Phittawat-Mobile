import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class Datas extends ChangeNotifier {
  Map<dynamic, dynamic> dailyRepeat = {
    1: {
      "Mon": "0",
      "Tue": "0",
      "Wed": "0",
      "Thu": "0",
      "Fri": "0",
      "Sat": "0",
      "Sun": "0"
    },
  };
  void chooseDailyRepeat(String name) {
    dailyRepeat[1][name] = "false";
    debugPrint(dailyRepeat[1][name]);
    notifyListeners();
  }
}

class nameAndRepeat extends StatefulWidget {
  const nameAndRepeat(
      {Key? key,
      required this.user,
      required this.data,
      required this.factor1,
      required this.factor2,
      required this.type})
      : super(key: key);
  final data;
  final factor1;
  final List<dynamic> factor2;
  final type;
  final user;
  @override
  _nameAndRepeatState createState() => _nameAndRepeatState();
}

class _nameAndRepeatState extends State<nameAndRepeat> {
  final _database = FirebaseDatabase.instance.reference();
  var _data;

  @override
  void initState() {
    super.initState();
    _activateListeners();
  }

  void _activateListeners() {
    _database.child("user/${widget.user.displayName}/").onValue.listen((event) {
      final data = event.snapshot.value;
      setState(() {
        _data = data;
      });
    });
  }

  // Widget AllPlanPrint() {
  //   var count = 0;
  //   for (var i = 0; widget.data['Plan'][0]['Training'].length + 1 > i; i++) {
  //     count++;
  //   }
  //
  //   return count;
  // }

  void SendData(PVdata) {
    //var PVdata = Provider.of<Datas>(context, listen: false).dailyRepeat;
    //debugPrint('${widget.factor1[1]["Repetition"]}');
    final SetFinish =
        _database.child('user/${widget.user.displayName}/Plan/0/');
    //.child('user/${widget.user.displayName}/Plan/0/Training/$i/Train/Repeat/');
    //for (var i = 0; _data[0]['Training'].length + 1 > i; i++) {}
    //debugPrint('${widget.data['Plan'][0]['Training'][0]}');
    debugPrint('${PVdata}');
    var count = 0;
    for (var i = 0; widget.data['Plan'][0]['Training'].length > i; i++) {
      count++;
    }

    if (count == 2) {
      if (widget.type == 'Weight Training') {
        SetFinish.update({
          "Training": [
            widget.data['Plan'][0]['Training'][0],
            widget.data['Plan'][0]['Training'][1],
            {
              "Train": {
                "Rep": [
                  widget.factor1[1]["Repetition"],
                  widget.factor1[2]["Repetition"],
                  widget.factor1[3]["Repetition"],
                  widget.factor1[4]["Repetition"],
                  widget.factor1[5]["Repetition"],
                ],
                "Repeat": {
                  "Monday": "${PVdata[1]['Mon']}",
                  "Tuesday": "${PVdata[1]['Tue']}",
                  "Wednesday": "${PVdata[1]['Wed']}",
                  "Thursday": "${PVdata[1]['Thu']}",
                  "Friday": "${PVdata[1]['Fri']}",
                  "Saturday": "${PVdata[1]['Sat']}",
                  "Sunday": "${PVdata[1]['Sun']}",
                },
                "Weight": [
                  widget.factor1[1]["Weights"],
                  widget.factor1[2]["Weights"],
                  widget.factor1[3]["Weights"],
                  widget.factor1[4]["Weights"],
                  widget.factor1[5]["Weights"],
                ],
              },
              "type": widget.type
            },
          ]
        })
            .then((_) => print("Special of the day has been written"))
            .catchError((error) => print("You get an error! $error"));
      }
      if (widget.type == 'Running') {
        SetFinish.update({
          "Training": [
            widget.data['Plan'][0]['Training'][0],
            widget.data['Plan'][0]['Training'][1],
            {
              "Train": {
                "Pace": widget.factor1[0],
                "Repeat": {
                  "Monday": "${PVdata[1]['Mon']}",
                  "Tuesday": "${PVdata[1]['Tue']}",
                  "Wednesday": "${PVdata[1]['Wed']}",
                  "Thursday": "${PVdata[1]['Thu']}",
                  "Friday": "${PVdata[1]['Fri']}",
                  "Saturday": "${PVdata[1]['Sat']}",
                  "Sunday": "${PVdata[1]['Sun']}",
                },
                "Distance": widget.factor2[0],
              },
              "type": widget.type
            },
          ]
        })
            .then((_) => print("Special of the day has been written"))
            .catchError((error) => print("You get an error! $error"));
      }
    }
    if (count == 3) {
      if (widget.type == 'Weight Training') {
        SetFinish.update({
          "Training": [
            widget.data['Plan'][0]['Training'][0],
            widget.data['Plan'][0]['Training'][1],
            widget.data['Plan'][0]['Training'][2],
            {
              "Train": {
                "Rep": [
                  widget.factor1[1]["Repetition"],
                  widget.factor1[2]["Repetition"],
                  widget.factor1[3]["Repetition"],
                  widget.factor1[4]["Repetition"],
                  widget.factor1[5]["Repetition"],
                ],
                "Repeat": {
                  "Monday": "${PVdata[1]['Mon']}",
                  "Tuesday": "${PVdata[1]['Tue']}",
                  "Wednesday": "${PVdata[1]['Wed']}",
                  "Thursday": "${PVdata[1]['Thu']}",
                  "Friday": "${PVdata[1]['Fri']}",
                  "Saturday": "${PVdata[1]['Sat']}",
                  "Sunday": "${PVdata[1]['Sun']}",
                },
                "Weight": [
                  widget.factor1[1]["Weights"],
                  widget.factor1[2]["Weights"],
                  widget.factor1[3]["Weights"],
                  widget.factor1[4]["Weights"],
                  widget.factor1[5]["Weights"],
                ],
              },
              "type": widget.type
            },
          ]
        })
            .then((_) => print("Special of the day has been written"))
            .catchError((error) => print("You get an error! $error"));
      }
      if (widget.type == 'Running') {
        SetFinish.update({
          "Training": [
            widget.data['Plan'][0]['Training'][0],
            widget.data['Plan'][0]['Training'][1],
            widget.data['Plan'][0]['Training'][2],
            {
              "Train": {
                "Pace": widget.factor1[0],
                "Repeat": {
                  "Monday": "${PVdata[1]['Mon']}",
                  "Tuesday": "${PVdata[1]['Tue']}",
                  "Wednesday": "${PVdata[1]['Wed']}",
                  "Thursday": "${PVdata[1]['Thu']}",
                  "Friday": "${PVdata[1]['Fri']}",
                  "Saturday": "${PVdata[1]['Sat']}",
                  "Sunday": "${PVdata[1]['Sun']}",
                },
                "Distance": widget.factor2[0],
              },
              "type": widget.type
            },
          ]
        })
            .then((_) => print("Special of the day has been written"))
            .catchError((error) => print("You get an error! $error"));
      }
    }
    if (count == 4) {
      if (widget.type == 'Weight Training') {
        SetFinish.update({
          "Training": [
            widget.data['Plan'][0]['Training'][0],
            widget.data['Plan'][0]['Training'][1],
            widget.data['Plan'][0]['Training'][2],
            widget.data['Plan'][0]['Training'][3],
            {
              "Train": {
                "Rep": [
                  widget.factor1[1]["Repetition"],
                  widget.factor1[2]["Repetition"],
                  widget.factor1[3]["Repetition"],
                  widget.factor1[4]["Repetition"],
                  widget.factor1[5]["Repetition"],
                ],
                "Repeat": {
                  "Monday": "${PVdata[1]['Mon']}",
                  "Tuesday": "${PVdata[1]['Tue']}",
                  "Wednesday": "${PVdata[1]['Wed']}",
                  "Thursday": "${PVdata[1]['Thu']}",
                  "Friday": "${PVdata[1]['Fri']}",
                  "Saturday": "${PVdata[1]['Sat']}",
                  "Sunday": "${PVdata[1]['Sun']}",
                },
                "Weight": [
                  widget.factor1[1]["Weights"],
                  widget.factor1[2]["Weights"],
                  widget.factor1[3]["Weights"],
                  widget.factor1[4]["Weights"],
                  widget.factor1[5]["Weights"],
                ],
              },
              "type": widget.type
            },
          ]
        })
            .then((_) => print("Special of the day has been written"))
            .catchError((error) => print("You get an error! $error"));
      }
      if (widget.type == 'Running') {
        SetFinish.update({
          "Training": [
            widget.data['Plan'][0]['Training'][0],
            widget.data['Plan'][0]['Training'][1],
            widget.data['Plan'][0]['Training'][2],
            widget.data['Plan'][0]['Training'][3],
            {
              "Train": {
                "Pace": widget.factor1[0],
                "Repeat": {
                  "Monday": "${PVdata[1]['Mon']}",
                  "Tuesday": "${PVdata[1]['Tue']}",
                  "Wednesday": "${PVdata[1]['Wed']}",
                  "Thursday": "${PVdata[1]['Thu']}",
                  "Friday": "${PVdata[1]['Fri']}",
                  "Saturday": "${PVdata[1]['Sat']}",
                  "Sunday": "${PVdata[1]['Sun']}",
                },
                "Distance": widget.factor2[0],
              },
              "type": widget.type
            },
          ]
        })
            .then((_) => print("Special of the day has been written"))
            .catchError((error) => print("You get an error! $error"));
      }
    }
    if (count == 5) {
      if (widget.type == 'Weight Training') {
        SetFinish.update({
          "Training": [
            widget.data['Plan'][0]['Training'][0],
            widget.data['Plan'][0]['Training'][1],
            widget.data['Plan'][0]['Training'][2],
            widget.data['Plan'][0]['Training'][3],
            widget.data['Plan'][0]['Training'][4],
            {
              "Train": {
                "Rep": [
                  widget.factor1[1]["Repetition"],
                  widget.factor1[2]["Repetition"],
                  widget.factor1[3]["Repetition"],
                  widget.factor1[4]["Repetition"],
                  widget.factor1[5]["Repetition"],
                ],
                "Repeat": {
                  "Monday": "${PVdata[1]['Mon']}",
                  "Tuesday": "${PVdata[1]['Tue']}",
                  "Wednesday": "${PVdata[1]['Wed']}",
                  "Thursday": "${PVdata[1]['Thu']}",
                  "Friday": "${PVdata[1]['Fri']}",
                  "Saturday": "${PVdata[1]['Sat']}",
                  "Sunday": "${PVdata[1]['Sun']}",
                },
                "Weight": [
                  widget.factor1[1]["Weights"],
                  widget.factor1[2]["Weights"],
                  widget.factor1[3]["Weights"],
                  widget.factor1[4]["Weights"],
                  widget.factor1[5]["Weights"],
                ],
              },
              "type": widget.type
            },
          ]
        })
            .then((_) => print("Special of the day has been written"))
            .catchError((error) => print("You get an error! $error"));
      }
      if (widget.type == 'Running') {
        SetFinish.update({
          "Training": [
            widget.data['Plan'][0]['Training'][0],
            widget.data['Plan'][0]['Training'][1],
            widget.data['Plan'][0]['Training'][2],
            widget.data['Plan'][0]['Training'][3],
            widget.data['Plan'][0]['Training'][4],
            {
              "Train": {
                "Pace": widget.factor1[0],
                "Repeat": {
                  "Monday": "${PVdata[1]['Mon']}",
                  "Tuesday": "${PVdata[1]['Tue']}",
                  "Wednesday": "${PVdata[1]['Wed']}",
                  "Thursday": "${PVdata[1]['Thu']}",
                  "Friday": "${PVdata[1]['Fri']}",
                  "Saturday": "${PVdata[1]['Sat']}",
                  "Sunday": "${PVdata[1]['Sun']}",
                },
                "Distance": widget.factor2[0],
              },
              "type": widget.type
            },
          ]
        })
            .then((_) => print("Special of the day has been written"))
            .catchError((error) => print("You get an error! $error"));
      }
    }
    // for (var i = 0; data[0]['Training'].length > i; i++) {
    //
    // }
  }

  Widget build(BuildContext context) {
    _activateListeners();
    return ChangeNotifierProvider<Datas>(
        create: (context) => Datas(),
        child: Builder(
            builder: (context) => Card(
                color: const Color(0xff3E4C59),
                margin: const EdgeInsets.only(bottom: 150, top: 50),
                child: Consumer<Datas>(
                  builder: (_, Data, __) => Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: const Text(
                          "When will you achive the goal?",
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30, bottom: 10),
                        child: const Text("Plan name",
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
                      ),
                      const DropBlockCaller(),
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        child: const Text("Repeat",
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
                      ),
                      SizedBox(
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            dateclick(
                              date: "Mon",
                            ),
                            dateclick(
                              date: "Tue",
                            ),
                            dateclick(
                              date: "Wed",
                            ),
                            dateclick(
                              date: "Thu",
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            dateclick(
                              date: "Fri",
                            ),
                            dateclick(
                              date: "Sat",
                            ),
                            dateclick(
                              date: "Sun",
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        child: TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color(0xffEF5DA8)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: const BorderSide(
                                      color: Color(0xffEF5DA8)),
                                ))),
                            onPressed: () {
                              print(widget.factor1);
                              print(widget.factor2);
                              print(Data.dailyRepeat[1]["Wed"]);
                              SendData(Data.dailyRepeat);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              width: 270,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Confirm",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ],
                              ),
                            )),
                      )
                    ],
                  ),
                ))));
  }
}

class dateclick extends StatefulWidget {
  final date;

  const dateclick({Key? key, required this.date}) : super(key: key);

  @override
  _dateclickState createState() => _dateclickState();
}

class _dateclickState extends State<dateclick> {
  bool _isActive = true;

  void _handleTap() {
    setState(() {
      _isActive = !_isActive;
      Provider.of<Datas>(context, listen: false).chooseDailyRepeat(widget.date);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        alignment: Alignment.center,
        width: 50,
        height: 70,
        decoration: BoxDecoration(
          color: _isActive
              ? const Color(0xff323F4B).withOpacity(0.5)
              : const Color(0xff5A1B49).withOpacity(0.5),
          border: Border.all(
              color: _isActive ? Colors.transparent : Colors.white, width: 3),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Text(
          widget.date,
          style: const TextStyle(color: Color(0xffCBD2D9)),
        ),
      ),
      onTap: _handleTap,
    );
  }
}

class DropBlockCaller extends StatelessWidget {
  const DropBlockCaller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const dropBlock();
  }
}

class dropBlock extends StatefulWidget {
  const dropBlock({Key? key}) : super(key: key);

  @override
  _dropBlockState createState() => _dropBlockState();
}

class _dropBlockState extends State<dropBlock> {
  String? selectedValue;
  List<String> items = [
    'MyPlan1',
  ];
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        hint: const Center(
          child: Text(
            'Select Item',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
        items: items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value as String;
          });
        },
        buttonHeight: 40,
        buttonWidth: 200,
        itemHeight: 40,
        buttonPadding: const EdgeInsets.only(left: 14, right: 14),
        buttonDecoration: const BoxDecoration(
          color: Color(0xff323F4B),
        ),
      ),
    );
  }
}
