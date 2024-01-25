import 'package:flutter/material.dart';

class ShrinkWrapExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Container(
            margin: EdgeInsets.all(32),
            decoration: BoxDecoration(border: Border.all(color: Colors.red)),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                ListTile(title: Text('Item 1')),
                ListTile(title: Text('Item 2')),
                ListTile(title: Text('Item 3')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
