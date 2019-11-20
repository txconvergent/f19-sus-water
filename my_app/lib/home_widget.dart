import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  @override
 State<StatefulWidget> createState() {
  return _HomeState();
  }
}

class _HomeState extends State<HomeWidget>{
   final Color color = Colors.white;
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     body: Center(
     child: Column (
       mainAxisAlignment: MainAxisAlignment.center,
       children: <Widget>[
         Image.asset(
             'assets/water.png'
         ),
         Center(
             child: Text(
                 'Drip',
                 style: TextStyle(
                     fontSize: 60,
                     color: Colors.lightBlue
                 )
             )
         ),
         Padding(
           padding: EdgeInsets.all(8.0),
           child: Center(
               child: Text(
                   'An innovative way to conserve water',
                   style: TextStyle(
                       fontSize: 20,
                       color: Colors.blueGrey
                   )
               )
           ),
         ),
       ],
     ),
   ),
     backgroundColor: color,
   );
 }
}