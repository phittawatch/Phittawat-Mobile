import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:createplan_running/Login/login_page.dart';
import 'package:createplan_running/plan_workout/showplan.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:createplan_running/ShowPlanDay/call_exercise_page.dart';
import 'package:createplan_running/wieght_training.dart';
import 'package:createplan_running/running_training.dart';
import 'package:createplan_running/profile/main.dart';

class BodyContent extends StatefulWidget {
  final user;
  BodyContent({Key? key, required this.user}) : super(key: key);

  @override
  _BodyContentState createState() => _BodyContentState();
}

class Category {
  String name;
  IconData icon;
  Category(this.name, this.icon);
}

List<Category> _categories = [
  Category('Running', Icons.directions_run),
  Category('Weight', Icons.fitness_center),
  Category('Swimming', Icons.pool),
];
Widget checkCatagory(plan, user, data) {
  if (plan == "Running") {
    debugPrint("Go Running");
    return backgroundReturn(
      user: user,
      data: data,
    );
  }
  if (plan == "Weight") {
    debugPrint("Go Weight");
    return backgroundReturnWeight(
      user: user,
      data: data,
    );
  } else {
    debugPrint('$plan');
    return Container();
  }
}

Widget workoutType(index, context, user, data) {
  return TextButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  checkCatagory(_categories[index].name, user, data),
            ));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        width: 100,
        height: 125,
        child: Card(
          color: const Color(0xff1F2933),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _categories[index].icon,
                size: 48,
                color: Colors.white,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                _categories[index].name,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ));
}

// void AddDefult(data) {
//    if (data['user'])
// }

class _BodyContentState extends State<BodyContent> {
  var _data;
  final _database = FirebaseDatabase.instance.reference();
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
        // if (_data == null) {
        //   final create_user_if_None =
        //       _database.child('user/${widget.user.displayName}');
        //   create_user_if_None
        //       .set({
        //         "Plan": [
        //           {
        //             "PlanName": "MyPlan1",
        //             "History": {"2022-04-19": "Done", "2022-04-20": "Not Done"},
        //             "Training": [
        //               {
        //                 "Train": {
        //                   "Rep": [10, 5, 6, 8, 7],
        //                   "Repeat": {
        //                     "Monday": "False",
        //                     "Tuesday": "0",
        //                     "Wednesday": "False",
        //                     "Thursday": "0",
        //                     "Friday": "0",
        //                     "Saturday": "0",
        //                     "Sunday": "False",
        //                   },
        //                   "Weight": [15, 16, 20, 3, 500],
        //                 },
        //                 "type": "Weight Trainning"
        //               },
        //               {
        //                 "Train": {
        //                   "Distance": 30,
        //                   "Pace": 20,
        //                   "Repeat": {
        //                     "Monday": "False",
        //                     "Tuesday": "0",
        //                     "Wednesday": "False",
        //                     "Thursday": "0",
        //                     "Friday": "False",
        //                     "Saturday": "0",
        //                     "Sunday": "0",
        //                   },
        //                 },
        //                 "type": "Running"
        //               }
        //             ],
        //           }
        //         ]
        //       })
        //       .then((_) => print("Special of the day has been written"))
        //       .catchError((error) => print("You get an error! $error"));
        // }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final create_user_if_None =
        _database.child('user/${widget.user.displayName}');
    _activateListeners();
    //_data = _data[widget.user.displayName];
    // create_user_if_None
    //     .set({
    //       "Plan": [
    //         {
    //           "PlanName": "MyPlan1",
    //           "History": {"2022-04-19": "Done", "2022-04-20": "Not Done"},
    //           "Training": [
    //             {
    //               "Train": {
    //                 "Rep": [10, 5, 6, 8, 7],
    //                 "Repeat": {
    //                   "Monday": "False",
    //                   "Tuesday": "0",
    //                   "Wednesday": "False",
    //                   "Thursday": "0",
    //                   "Friday": "0",
    //                   "Saturday": "0",
    //                   "Sunday": "False",
    //                 },
    //                 "Weight": [15, 16, 20, 3, 500],
    //               },
    //               "type": "Weight Trainning"
    //             },
    //             {
    //               "Train": {
    //                 "Distance": 30,
    //                 "Pace": 20,
    //                 "Repeat": {
    //                   "Monday": "False",
    //                   "Tuesday": "0",
    //                   "Wednesday": "False",
    //                   "Thursday": "0",
    //                   "Friday": "False",
    //                   "Saturday": "0",
    //                   "Sunday": "0",
    //                 },
    //               },
    //               "type": "Running"
    //             }
    //           ],
    //         }
    //       ]
    //     })
    //     .then((_) => print("Special of the day has been written"))
    //     .catchError((error) => print("You get an error! $error"));

    return Stack(children: [
      //await Future.delayed(const Duration(seconds: 2), () {});
      Container(
        width: 400,
        height: 400,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [const Color(0xff725a94).withOpacity(0.5), Colors.black45],
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
            colors: [const Color(0xffa6789e).withOpacity(0.5), Colors.black45],
            center: const Alignment(-1.2, 0.7),
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            final provider = Provider.of<GoogleSignInProvider>(
                                context,
                                listen: false);
                            provider.logout();
                          },
                          child: Text("Logout")),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyProfile(
                                      data: _data['Plan'], user: widget.user),
                                ));
                            // MyProfile
                          },
                          child: CircleAvatar(
                            //backgroundColor: Colors.white,
                            backgroundImage:
                                NetworkImage(widget.user.photoURL!),
                          ))
                    ],
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 8),
                child: Text(
                  "Hello, " + widget.user.displayName!,
                  style: TextStyle(color: Color(0xffCBD2D9), fontSize: 16),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: const Text(
                  "WELCOME BACK!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.19,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  color: const Color(0xff7B8794).withOpacity(0.6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 8,
                  child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CallingExercisePage(
                                      data: _data['Plan'], user: widget.user),
                                ));
                          },
                          child: ReturnCurrectPlanState(_data))),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 32, 0, 18),
                child: const Text(
                  "Catagories",
                  style: TextStyle(
                      color: Color(0xffCBD2D9),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 38),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      workoutType(0, context, widget.user, _data),
                      workoutType(1, context, widget.user, _data),
                      workoutType(2, context, widget.user, _data),
                      workoutType(0, context, widget.user, _data),
                      workoutType(1, context, widget.user, _data),
                      workoutType(2, context, widget.user, _data),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "New Celebrities Inspired Plan",
                        style: TextStyle(
                            color: Color(0xffCBD2D9),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "See more",
                        style: TextStyle(
                          color: Color(0xffCBD2D9),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    height: MediaQuery.of(context).size.height * 0.19,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image.network(
                        "https://images.pexels.com/photos/5012071/pexels-photo-5012071.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                        fit: BoxFit.fitWidth,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.19,
                    width: MediaQuery.of(context).size.width,
                    child: const Card(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ]);
  }

  Widget ReturnCurrectPlanState(data) {
    // _database.child('user/${user.displayName}/Plan/0/History/');
    // SetFinish.update({'History': {_selectedValue.toString().split(' ')[0]:"Done"}
    DateTime _selectedValue = DateTime.now();
    if (data['Plan'][0]['History'][_selectedValue.toString().split(' ')[0]] ==
        "Done") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Your Workout Plan For Today",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                width: 162,
                height: 78,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(
                        'https://images.pexels.com/photos/28076/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20),
                child: Text(
                  "Done!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Icon(
                Icons.play_circle_outlined,
                color: Color(0xffEF5DA8),
                size: 42,
              ),
            ],
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Your Workout Plan For Today",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                width: 162,
                height: 78,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(
                        'https://images.pexels.com/photos/28076/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20),
                child: Text(
                  "0/${_data['Plan'][0]['Training'].length} Left!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Icon(
                Icons.play_circle_outlined,
                color: Color(0xffEF5DA8),
                size: 42,
              ),
            ],
          ),
        ],
      );
    }
  }
}
