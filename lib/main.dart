import 'package:flutter/material.dart';
import 'package:professor_interface/screens/WelcomeScreen.dart';
import 'package:professor_interface/screens/coursesList.dart';
import 'package:professor_interface/screens/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    checkUserSignedIn();
  }

  void checkUserSignedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isUserLoggedIn = (prefs.getBool('isUserLoggedIn') ?? false);
    });
  }

  bool isUserLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.black,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.black,
          )),
      title: 'IHRD',
      home: isUserLoggedIn ? Dashboard() : WelcomeScreen(),
    );
  }
}
