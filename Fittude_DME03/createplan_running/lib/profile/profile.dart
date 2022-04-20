import 'package:flutter/material.dart';

class WorkoutStats extends StatelessWidget {
  const WorkoutStats({Key? key, this.statname = "Workout", this.statnum = 0})
      : super(key: key);
  final String statname;
  final int statnum;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: 100,
      height: 55,
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(7))),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$statnum"),
          Text(statname),
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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: const [
          Text(
            "weekly activity",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: SafeArea(
        child: Column(
          children: [
            const Center(
                child: Text(
              "My profile",
              style: TextStyle(color: Colors.white),
            )),
            const Text(
              "Profile pic",
              style: TextStyle(color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                WorkoutStats(),
                WorkoutStats(),
                WorkoutStats(),
              ],
            ),
            WeeklyAct(),
          ],
        ),
      ),
    );
  }
}
