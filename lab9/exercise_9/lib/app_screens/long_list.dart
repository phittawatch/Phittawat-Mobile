import 'package:flutter/material.dart';

List<String> getListElements(plusultra) {
  var items = List<String>.generate(plusultra, (counter) => "Problem ${counter+1}");
  return items;
}

Widget getListView(emptyvar){
  var listItems = getListElements(emptyvar);

  var listView = ListView.builder(
      itemCount: listItems.length,
      itemBuilder: (context, index) {

      if (index.isOdd) {
        return ListTile(
          trailing: Icon(Icons.star),
          leading: const Icon(Icons.arrow_right),
          title: Text(listItems[index]),
          onTap: () {
            debugPrint('${listItems[index]} was tapped');
            ScaffoldMessenger.of(context).
            showSnackBar(SnackBar(content: Text("Problem ${index+1} is my favorite"),
                action: SnackBarAction(label: "Undo", onPressed: () {  },)));
          },
        );
      }
      else{
        return ListTile(
          leading: const Icon(Icons.arrow_right),
          title: Text(listItems[index]),
          onTap: () {
            debugPrint('${listItems[index]} was tapped');
            ScaffoldMessenger.of(context).
            showSnackBar(SnackBar(content: Text("Problem ${index+1} is selected"),
                action: SnackBarAction(label: "Undo", onPressed: () {  },)));
          },
        );
      }
    }
    );
  return listView;
}