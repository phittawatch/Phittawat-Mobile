import 'package:flutter/material.dart';

class PeteButton extends StatelessWidget {
  const PeteButton({Key? key}) : super(key: key);

  void alertMsg(BuildContext context){
    var alertDialog = const AlertDialog(
      title: Text("Submit Succesfully"),
      content: Text("Good work"),
    );

    showDialog(context: context,
        builder: (BuildContext context) => alertDialog);

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(50),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.lightGreenAccent,
          padding: const EdgeInsets.all(12),
          textStyle: const TextStyle(fontSize: 30),
        ),
        child: const Text("Submit",
          style: TextStyle(color: Colors.redAccent)),
      onPressed:() => {
          alertMsg(context)
    }
    )
    );
  }
}