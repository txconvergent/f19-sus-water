import 'package:flutter/material.dart';
import 'package:my_app/home_widget.dart';
import 'package:my_app/profile_widget.dart';
import 'package:my_app/search_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: NavBar(),
      routes: {
        ExtractItemArguments.routeName: (context) => ExtractItemArguments(),
      }
      );
  }
}

class NavBarState extends State<NavBar> {
  @override
  int _currentIndex = 0;
  final List<Widget> _children = [HomeWidget(), SearchWidget(), ProfileWidget()];
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber,
        onTap: onTabTapped,
        currentIndex: _currentIndex, // this will be set when a new tab is tapped
        items: [
         BottomNavigationBarItem(
           backgroundColor: Colors.lightBlue,
           icon: new Icon(Icons.home),
           title: new Text('Home'),
         ),
         BottomNavigationBarItem(
           backgroundColor: Colors.lightBlue,
           icon: new Icon(Icons.search),
           title: new Text('Search'),
         ),
         BottomNavigationBarItem(
           backgroundColor: Colors.lightBlue,
           icon:Icon(Icons.person),
           title: Text('Profile')
         ),
       ],
     ),
    );
  }
  void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }
}

  class NavBar extends StatefulWidget {
    @override
    NavBarState createState() => NavBarState();
  }