import 'package:flutter/material.dart';

class ProfileWidget extends StatefulWidget {
  @override
 State<StatefulWidget> createState() {
  return _ProfileState();
  }
}

class _ProfileState extends State<ProfileWidget>{
   final Color color = Colors.white;
 @override
 Widget build(BuildContext context) {
   return Container(
     color: color,
   );
 }
}
