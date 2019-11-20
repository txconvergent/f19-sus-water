import 'package:flutter/material.dart';

class ItemWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ItemState();
  }
}

class _ItemState extends State<ItemWidget> {

  _ItemState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
            //debugPrint(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}