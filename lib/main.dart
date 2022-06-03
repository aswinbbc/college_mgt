import 'package:flutter/material.dart';
import 'package:ihrd/Models/student_model.dart';
import 'package:ihrd/screens/WelcomeScreen.dart';
import 'package:ihrd/screens/coursesList.dart';
import 'package:ihrd/screens/dashboard.dart';
import 'package:ihrd/screens/dashboardStudent.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  ErrorWidget.builder = (FlutterErrorDetails details) => Container();
  runApp(MyApp());
}

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
      isUserTeacher = (prefs.getBool('teacher') ?? false);
    });
  }

  bool isUserLoggedIn = false;
  bool isUserTeacher = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.black,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.black,
          ),
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Colors.black)),
      title: 'IHRD',
      home: isUserLoggedIn
          ? (isUserTeacher ? Dashboard() : StudentDashboard())
          : WelcomeScreen(),
    );
  }
}
