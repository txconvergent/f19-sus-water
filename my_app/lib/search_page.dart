import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  @override
 State<StatefulWidget> createState() {
  return _SearchState();
  }
}

class _SearchState extends State<SearchWidget>{
   final Color color = Colors.white;
 @override
 Widget build(BuildContext context) {
   return Container(
     color: color,
   );
 }
}
