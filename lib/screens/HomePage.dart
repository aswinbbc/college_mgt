import 'package:flutter/material.dart';
import 'package:ihrd/screens/Page1.dart';
import 'package:ihrd/screens/Page2.dart';

class HomePage extends StatefulWidget {
  final String id;
  HomePage(this.id);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  // String courseId;
  int _currentIndex = 0;
  List<Widget> widgetOptions = [];

  Widget build(BuildContext context) {
    widgetOptions = [
      Page1(widget.id),
      Page2(widget.id),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('IHRD'),
      ),
      body: widgetOptions.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.6),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          // Respond to item press.
          setState(() => _currentIndex = value);
        },
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Enrolled Students',
            icon: Icon(Icons.format_list_bulleted),
          ),
          // BottomNavigationBarItem(
          //   label: 'Settings',
          //   icon: Icon(Icons.account_circle_outlined),
          // ),
        ],
      ),
    );
  }
}
