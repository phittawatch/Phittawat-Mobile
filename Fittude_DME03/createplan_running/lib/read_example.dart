import 'package:flutter/material.dart';

class ReadExample extends StatefulWidget {
  const ReadExample({Key? key}) : super(key: key);

  @override
  State<ReadExample> createState() => _WriteExampleState();
}

class _WriteExampleState extends State<ReadExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Read Page")),
      body: Column(),
    );
  }
}
