import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:createplan_running/Login/login_page.dart';
import 'package:createplan_running/plan_workout/showplan.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:createplan_running/ShowPlanDay/call_exercise_page.dart';

class ReturnPlan extends StatefulWidget {
  final data;
  const ReturnPlan({Key? key, required this.data}) : super(key: key);

  @override
  State<ReturnPlan> createState() => _ReturnPlanState();
}

class _ReturnPlanState extends State<ReturnPlan> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
