import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'select_date.dart';

// void main() => runApp(const MyApp());
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
//       home: backgroundReturn(),
//     );
//   }
// }

class backgroundReturn extends StatelessWidget {
  final user;
  final data;
  const backgroundReturn({Key? key, required this.user, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            user: user,
            data: data,
          )
        ]));
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
                    margin: EdgeInsets.only(left: 100),
                    alignment: Alignment.center,
                    child: const Text("Running",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
              Center(
                child: runningoption(
                  data: widget.data,
                  user: widget.user,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class runningoption extends StatefulWidget {
  final user;
  final data;
  const runningoption({
    Key? key,
    required this.user,
    required this.data,
  }) : super(key: key);

  @override
  _runningoptionState createState() => _runningoptionState();
}

class _runningoptionState extends State<runningoption> {
  double distance = 0;
  double pace = 0;
  var disList = [];
  var paceList = [];
  //TODO i this thing it's ok try value of slider make it in from of array [distance, pace]
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context) => Data(),
      child: Builder(builder: (context) {
        return Column(
          children: [
            Container(
              width: 350,
              height: 250,
              margin: EdgeInsets.only(bottom: 20, top: 50),
              decoration: BoxDecoration(
                  color: Color(0xff7B8794).withOpacity(0.5),
                  border: Border.all(color: Colors.transparent),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: const Text(
                      "Pace (min/km)",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    width: 200,
                    decoration: const BoxDecoration(
                        color: Color(0xffff455a64),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: TextField(
                      textAlign: TextAlign.center,
                      onChanged: (val) {
                        pace = double.parse(val);
                      },
                      style: const TextStyle(
                          fontSize: 72,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: '00.00',
                          hintStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 350,
              height: 250,
              margin: const EdgeInsets.only(
                bottom: 20,
              ),
              decoration: BoxDecoration(
                  color: Color(0xff7B8794).withOpacity(0.5),
                  border: Border.all(color: Colors.transparent),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: const Text(
                      "Distance (km)",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(25),
                    child: Text(
                      "${distance.toStringAsFixed(1)}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 72,
                          color: Colors.white),
                    ),
                  ),
                  Center(
                      child: SfSliderTheme(
                    data: SfSliderThemeData(
                      activeTrackColor: Color(0xffEF5DA8),
                      inactiveTrackColor: Color(0xffEF5DA8),
                    ),
                    child: SfSlider(
                      min: 0.0,
                      max: 100.0,
                      value: distance,
                      activeColor: Color(0xffEF5DA8),
                      inactiveColor: Colors.white,
                      interval: 10,
                      showDividers: true,
                      dividerShape: _DividerShape(),
                      onChanged: (dynamic newValue) {
                        setState(() {
                          distance = newValue;
                        });
                      },
                    ),
                  )),
                  const Text(
                    "0                                                                                 100",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Consumer<Data>(
              builder: (context, provider, child) {
                return TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xffEF5DA8)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(color: Color(0xffEF5DA8)),
                        ))),
                    onPressed: () {
                      Provider.of<Data>(context, listen: false)
                          .changingRunDistance(distance, pace);
                      disList.add(distance);
                      paceList.add(pace);
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return nameAndRepeat(
                                data: widget.data,
                                user: widget.user,
                                type: "Running",
                                factor1: disList,
                                factor2: paceList);
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
                    ));
              },
            ),
          ],
        );
      }),
    );
  }
}

class _DividerShape extends SfDividerShape {
  @override
  void paint(PaintingContext context, Offset center, Offset? thumbCenter,
      Offset? startThumbCenter, Offset? endThumbCenter,
      {required RenderBox parentBox,
      required SfSliderThemeData themeData,
      SfRangeValues? currentValues,
      dynamic currentValue,
      required Paint? paint,
      required Animation<double> enableAnimation,
      required TextDirection textDirection}) {
    bool isActive;

    switch (textDirection) {
      case TextDirection.ltr:
        isActive = center.dx <= thumbCenter!.dx;
        break;
      case TextDirection.rtl:
        isActive = center.dx >= thumbCenter!.dx;
        break;
    }

    context.canvas.drawRect(
        Rect.fromCenter(center: center, width: 5.0, height: 10.0),
        Paint()
          ..isAntiAlias = true
          ..style = PaintingStyle.fill
          ..color = isActive ? themeData.activeTrackColor! : Colors.white);
  }
}

class Data extends ChangeNotifier {
  double distance = 0;
  double pace = 0;
  void changingRunDistance(double newValue, double newValue2) {
    distance = newValue;
    pace = newValue2;
    notifyListeners();
  }
}
