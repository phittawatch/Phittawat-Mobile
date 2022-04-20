import 'package:flutter/material.dart';
import 'chart.dart';
import 'package:flutter/cupertino.dart';

class WorkoutStats extends StatelessWidget {
  WorkoutStats(
      {Key? key, required this.statName, required this.statNum, this.data})
      : super(key: key);
  final String statName;
  final int statNum;
  final data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      width: 100,
      height: 55,
      decoration: BoxDecoration(
          color: Colors.blueGrey.shade900,
          borderRadius: const BorderRadius.all(Radius.circular(7))),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$statNum",
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xffEF5DA8)),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            statName,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ],
      )),
    );
  }
}

class WeeklyAct extends StatefulWidget {
  const WeeklyAct({Key? key}) : super(key: key);

  @override
  _WeeklyActState createState() => _WeeklyActState();
}

class _WeeklyActState extends State<WeeklyAct> {
  Widget content() {
    return Container(
        margin: const EdgeInsets.only(top: 20), child: const BarChartSample3());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(20, 20, 0, 10),
          child: const Text(
            "weekly activity",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: SizedBox(
            child: DefaultTabController(
                length: 3, // length of tabs
                initialIndex: 0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TabBar(
                        indicatorColor: Color(0xffEF5DA8),
                        labelColor: Color(0xffEF5DA8),
                        unselectedLabelColor: Colors.blueGrey.shade200,
                        tabs: const [
                          Tab(text: 'Cardio'),
                          Tab(text: 'Running'),
                          Tab(text: 'Weight'),
                        ],
                      ),
                      Container(
                          height: 250, //height of TabBarView
                          decoration: const BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Colors.blueGrey, width: 0.8))),
                          child: TabBarView(children: <Widget>[
                            content(),
                            content(),
                            content(),
                          ]))
                    ])),
          ),
        ),
      ],
    );
  }
}

class MyProfile extends StatefulWidget {
  final data;
  final user;
  MyProfile({Key? key, required this.data, required this.user})
      : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: SafeArea(
        child: Stack(children: [
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
                colors: [
                  Colors.deepPurpleAccent.withOpacity(0.5),
                  Colors.black45
                ],
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    "My profile",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(widget.user.photoURL!),
                    radius: 35,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 5),
                child: Text(
                  widget.user.displayName!,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WorkoutStats(
                      statName: "Daily", data: widget.data, statNum: 3),
                  WorkoutStats(
                      statName: "Monthly", data: widget.data, statNum: 7),
                  WorkoutStats(
                      statName: "Overall", data: widget.data, statNum: 10),
                ],
              ),
              const WeeklyAct(),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                child: const Text(
                  "Manage Your Plan",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
