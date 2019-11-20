import 'package:flutter/material.dart';
import 'package:my_app/search_page.dart';

class ExtractItemArguments extends StatelessWidget {
  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute settings and cast
    // them as ScreenArguments.
    final ItemArguments args = ModalRoute.of(context).settings.arguments;
    final record = args.record;

    return Scaffold(
      appBar: AppBar(
        title: Text(record.name),
      ),
      body: Center(
        child: Text(record.likes.toString()),
      ),
    );
  }
}

class ItemArguments {
  final Record record;

  ItemArguments(this.record);
}