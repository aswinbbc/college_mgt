import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ihrd/HandleNetworking.dart';
import 'package:ihrd/components/CourseTile.dart';
import 'package:ihrd/screens/AddCourses.dart';
import 'package:ihrd/screens/dashboard.dart';
import 'package:ihrd/screens/view_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoursesList extends StatefulWidget {
  @override
  _CoursesListState createState() => _CoursesListState();
}

class _CoursesListState extends State<CoursesList> {
  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Log Out'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to log out??'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Yes"),
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();

                prefs.remove('isUserLoggedIn');
                prefs.remove('id');
                SystemNavigator.pop();
                //Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text("No"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future<List<CourseTile>>? coursesList;
  Future<void> fetchCoursesList() async {
    HandleNetworking handleNetworking = HandleNetworking();
    coursesList = handleNetworking.getCourses();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchCoursesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('IHRD'),
        actions: [
          IconButton(
              icon: Icon(
                Icons.power_settings_new,
                color: Colors.white,
              ),
              onPressed: () {
                _showMyDialog(context);
              })
        ],
      ),
      body: FutureBuilder<List<CourseTile>>(
        future: coursesList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return RefreshIndicator(
              onRefresh: fetchCoursesList,
              child: ListView(
                children: snapshot.data!,
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Dashboard()));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
