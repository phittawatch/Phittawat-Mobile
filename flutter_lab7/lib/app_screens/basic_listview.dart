import 'package:flutter/material.dart';
class BasicListView extends StatelessWidget{
  const BasicListView({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context){
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        ListTile(title: Text('Engineering'),
            leading: Icon(Icons.engineering),
            trailing: Icon(Icons.star),
            onTap:() =>
              ScaffoldMessenger.of(context).
              showSnackBar(const SnackBar(content: Text("EN")))),
        ListTile(title: Text('Argiculture'),
            leading: Icon(Icons.agriculture),
            onTap:() =>
              ScaffoldMessenger.of(context).
              showSnackBar(const SnackBar(content: Text("AG")))),
        ListTile(title: const Text('Architecture'),
            leading: const Icon(Icons.architecture),
            onTap:() =>
              ScaffoldMessenger.of(context).
              showSnackBar(const SnackBar(content: Text("AR"))),
      )
      ],
    );
  }
}