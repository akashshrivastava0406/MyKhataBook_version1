import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/khata_element.dart';

class KhataList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Text(
                "Upcoming Collections",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
            ),
            flex: 1,
          ),
          Divider(),
          Expanded(
            flex: 8,
            child: ListView(
              children: [
                KhataElement(),
                Divider(),
                KhataElement(),
                Divider(),
                KhataElement(),
                Divider(),
                KhataElement(),
                Divider(),
                KhataElement(),
              ],
            ),
          ),
          Divider(),
          Expanded(
              flex: 1,
              child: FlatButton(
                child: Text("Open Khata"),
              )),
        ],
      ),
    );
  }
}
