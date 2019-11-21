import 'package:flutter/material.dart';
import 'package:my_app/search_page.dart';

class ItemPage extends StatelessWidget {
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
          child: Column(
            children: <Widget>[
              Image.asset(
                  'assets/${record.name}.png',
                  fit: BoxFit.fitWidth
              ),
//              Text(
//                  'Water footprint: ${record.water} liters\nCarbon emission: ${record.carbon} kilos\nRoughly equivalent to driving ${record.car} miles\n${record.related}',
//                  style: TextStyle(
//                      fontSize: 20,
//                  )
//              )
            ],
          )
      ),
    );
  }
}

class ItemArguments {
  final Record record;

  ItemArguments(this.record);
}