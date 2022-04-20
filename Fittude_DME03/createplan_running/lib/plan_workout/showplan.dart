import 'package:flutter/material.dart';

void main() {
  runApp(const ShowPlanPage());
}

class step extends StatefulWidget {
  const step({Key? key, required this.maxstep}) : super(key: key);
  final int maxstep;
  @override
  _stepState createState() => _stepState();
}

class _stepState extends State<step> {
  var _step = 1;
  void tapnext() {
    setState(() {
      if (_step == widget.maxstep) {
        _step = widget.maxstep;
      } else {
        _step += 1;
      }
    });
  }

  void tapback() {
    setState(() {
      if (_step == 1) {
        _step = 1;
      } else {
        _step -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Round $_step/5",
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
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white,
                      ),
                      Text(
                        "Back",
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

class ShowPlanPage extends StatefulWidget {
  const ShowPlanPage({Key? key}) : super(key: key);

  @override
  _ShowPlanPageState createState() => _ShowPlanPageState();
}

class _ShowPlanPageState extends State<ShowPlanPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          body: Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Center(
              child: exercise(
                  "ข้าวผัดแมว",
                  const ["Weight", "20", "25", "30", "40", "50"],
                  const ["Repetitions", "1", "2", "3", "4", "5"]),
            ),
            const step(
              maxstep: 5,
            ),
          ],
        ),
      )),
      debugShowCheckedModeBanner: false,
    );
  }
}

class exercise extends StatefulWidget {
  exercise(this.title, this.weight, this.Repetitions);
  final String title;
  List<String> weight;
  List<String> Repetitions;

  @override
  State<exercise> createState() => _exerciseState();
}

class _exerciseState extends State<exercise> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40, bottom: 20),
          child: Text(widget.title,
              style: const TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w700)),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.black87,
              border: Border.all(color: Colors.black87),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          padding:
              const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
          height: 90,
          child: ListView.builder(
              itemCount: widget.weight.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var num = widget.weight[index];
                var num2 = widget.Repetitions[index];
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
        )
      ],
    );
  }
}
