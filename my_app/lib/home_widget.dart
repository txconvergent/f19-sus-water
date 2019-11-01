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
     backgroundColor: color,
   );
 }
}