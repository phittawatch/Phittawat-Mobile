import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'exercise.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:firebase_database/firebase_database.dart';

void main() => runApp(MyApp());

class NumberOfEx extends ChangeNotifier {
  int ExNum = 0;
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CallingExercisePage(),
    );
  }
}

class NumberOfExercise extends StatefulWidget {
  final data;
  final dayname;
  var count = 0;
  NumberOfExercise({Key? key, required this.data, required this.dayname})
      : super(key: key);

  @override
  State<NumberOfExercise> createState() => _NumberOfExerciseState();
}

class _NumberOfExerciseState extends State<NumberOfExercise> {
  final _database = FirebaseDatabase.instance.reference();
  @override
  //data[0]['History'][DateTime.now().toString().split(' ')[0]] != "Done"
  //data[0]['Training'][index]['Train']['Repeat'][dayname] == "False"
  // void returnNumber(){
  //   return 5
  // }

  Widget build(BuildContext context) {
    for (var i = 0; widget.data[0]['Training'].length > i; i++) {
      if (widget.data[0]['Training'][i]['Train']['Repeat'][widget.dayname] ==
          "False") {
        widget.count++;
      }
    }
    return Text(
      "${widget.count} Exercise",
      style: TextStyle(color: Colors.white, fontSize: 20),
    );
  }
}

class CallingExercisePage extends StatefulWidget {
  final data;
  final user;
  CallingExercisePage({Key? key, this.title, this.data, this.user})
      : super(key: key);
  final String? title;

  @override
  _CallingExercisePageState createState() => _CallingExercisePageState();
}

class _CallingExercisePageState extends State<CallingExercisePage> {
  DatePickerController _controller = DatePickerController();

  DateTime _selectedValue = DateTime.now();
  var _DayName;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        body: Stack(
          children: [
            // Text(
            //   map1['dog'].join(""),
            //   style: TextStyle(color: Colors.white),
            // ),
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
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Stack(
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
                            margin: EdgeInsets.only(left: 85),
                            child: Column(
                              children: [
                                Text("My Plan",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700)),
                                Text('${widget.data[0]['PlanName']}',
                                    // ${widget.data['Plan'][0]['PlanName']}
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(),
                  child: Column(
                    children: <Widget>[
                      // Text("You Selected:"),
                      // Padding(
                      //   padding: EdgeInsets.all(10),
                      // ),
                      Text(_selectedValue.toString()),

                      // Padding(
                      //   padding: EdgeInsets.all(20),
                      // ),
                      Container(
                        child: DatePicker(
                          DateTime.now(),
                          width: 60,
                          height: 80,
                          controller: _controller,
                          initialSelectedDate: DateTime.now(),
                          selectionColor: Colors.pinkAccent,
                          deselectionColor: Colors.blueGrey.shade300,
                          selectedTextColor: Colors.white,
                          dayTextStyle: TextStyle(),
                          onDateChange: (date) {
                            // New date selected
                            setState(() {
                              debugPrint(
                                  '${_selectedValue.toString().split(' ')}/ ${DateFormat('EEEE').format(date)}');
                              _selectedValue = date;
                              _DayName = DateFormat('EEEE').format(date);
                              // Provider.of<NumberOfEx>(context, listen: false)
                              //     .ExNum = 0;
                              //Provider.of<NumberOfEx>(context, listen: false).ExNum = 0;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 20),
                    alignment: Alignment.bottomLeft,
                    child: NumberOfExercise(
                      data: widget.data,
                      dayname: _DayName,
                    )),
                SizedBox(
                  height: 500,
                  child: exerciselist(
                    user: widget.user,
                    //userplan: Demolist,
                    data: widget.data,
                    dayname: _DayName,
                  ),
                )
              ],
            )
          ],
        ));
  }
}

class exerciselist extends StatefulWidget {
  final data;
  final dayname;
  final user;
  // ${DateFormat('EEEE').format(date)}

  exerciselist(
      {Key? key, required this.data, required this.dayname, required this.user})
      : super(key: key);

  @override
  State<exerciselist> createState() => _exerciselistState();
}

class _exerciselistState extends State<exerciselist> {
  void StateSet() {
    setState(() {
      Provider.of<NumberOfEx>(context, listen: false).ExNum += 1;
    });
  }

  Widget CheckEachPlan(data, exname, context, index, dayname) {
    Widget ImageReturn(index) {
      int x = 10;
      debugPrint('${widget.data[0]['Training'][index]['type']}');
      if (widget.data[0]['Training'][index]['type'] == "Weight Trainning") {
        return Container(
            height: 90,
            margin: EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: Color(0xffff455a64),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Center(
              child: ListTile(
                title: Text(
                  "${exname['type']}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Container(
                  width: 100,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: NetworkImage(
                          'https://cdn.discordapp.com/attachments/785164188271247402/965956867157295164/dumbellpress.jpeg'),
                    ),
                  ),
                  // child: const Text(
                  //   "Picture",
                  //   style: TextStyle(
                  //       fontSize: 20,
                  //       color: Colors.white,
                  //       fontWeight: FontWeight.w700),
                  // )
                ),
                trailing: const Icon(Icons.play_circle_rounded),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExercisePage(
                                user: widget.user,
                                data: data,
                              )));
                },
              ),
            ));
      }
      if (widget.data[0]['Training'][index]['type'] == "Running") {
        return Container(
            height: 90,
            margin: EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: Color(0xffff455a64),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Center(
              child: ListTile(
                title: Text(
                  "${exname['type']}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Container(
                  width: 100,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: NetworkImage(
                          'https://cdn.discordapp.com/attachments/785164188271247402/965956869275406346/running.jpg'),
                    ),
                  ),
                ),
                trailing: const Icon(Icons.play_circle_rounded),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExercisePage(
                                user: widget.user,
                                data: data,
                              )));
                },
              ),
            ));
      } else
        return Container(
            height: 90,
            margin: EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: Color(0xffff455a64),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Center(
              child: ListTile(
                title: Text(
                  "${exname['type']}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Container(
                  width: 100,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: NetworkImage('Nopic.jpg'),
                    ),
                  ),
                ),
                trailing: const Icon(Icons.play_circle_rounded),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExercisePage(
                                user: widget.user,
                                data: data,
                              )));
                },
              ),
            ));
    }

    if (data[0]['Training'][index]['Train']['Repeat'][dayname] == "False") {
      debugPrint(data[0]['Training'][index]['Train']['Repeat'][dayname]);
      //Provider.of<NumberOfEx>(context, listen: false).ExNum += 1;
      //int ExPrint = Provider.of<NumberOfEx>(context, listen: false).ExNum;
      //StateSet();
      return ImageReturn(index);
    } else {
      return Container();
    }
  }

  Widget CheckDayPlan(data) {
    if (data[0]['History'][DateTime.now().toString().split(' ')[0]] != "Done") {
      //debugPrint(data[0]['History'][DateTime.now().toString().split(' ')[0]]);
      return ListView.builder(
          itemCount: data[0]['Training'].length, //list length
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            var exname = data[0]['Training'][index];
            var item_index = index; //widget.weight[index];

            return CheckEachPlan(
                data, exname, context, item_index, widget.dayname);
          });
    } else {
      return Container(
        margin: EdgeInsets.only(top: 70),
        child: Text(
          "No Plan for to day :D",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CheckDayPlan(widget.data);
  }
}

//
// class exceriselist extends StatelessWidget {
//   final data;
//   final dayname;
//   // ${DateFormat('EEEE').format(date)}
//
//   exceriselist({Key? key, required this.data, required this.dayname})
//       : super(key: key);
//
// }
