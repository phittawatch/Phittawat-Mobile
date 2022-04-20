import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import './body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

void mainTest() {
  runApp(MyAppHome());
}

// ignore: use_key_in_widget_constructors
class MyAppHome extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //TODO: Change to homepage here
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _selectedTab = _SelectedTab.home;
  // final _database = FirebaseDatabase.instance.reference();

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    //_activateListeners();
    return Scaffold(
      backgroundColor: Colors.black45,
      extendBody: true,
      body: SafeArea(
          child: BodyContent(
        user: widget.user,
      )),
      bottomNavigationBar: DotNavigationBar(
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        onTap: _handleIndexChanged,
        unselectedItemColor: const Color(0xffababab),
        backgroundColor: const Color(0xff282d3a),
        dotIndicatorColor: const Color(0xff282d3a),
        // dotIndicatorColor: Colors.black,
        items: [
          /// Home
          DotNavigationBarItem(
            icon: const Icon(Icons.home),
            selectedColor: const Color(0xffEF5DA8),
          ),

          /// Likes
          DotNavigationBarItem(
            icon: const Icon(Icons.restaurant_menu),
            selectedColor: const Color(0xffEF5DA8),
          ),

          /// Search
          DotNavigationBarItem(
            icon: const Icon(Icons.event),
            selectedColor: const Color(0xffEF5DA8),
          ),

          /// Profile
          DotNavigationBarItem(
            icon: const Icon(Icons.person),
            selectedColor: Color(0xffEF5DA8),
          ),
        ],
      ),
    );
  }
}

enum _SelectedTab { home, favorite, search, person }
