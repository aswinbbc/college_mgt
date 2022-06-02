import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:ihrd/HandleNetworking.dart';
import 'package:ihrd/screens/HomePage.dart';

class CourseTile extends StatelessWidget {
  final String id;
  final String courseName;
  final String courseCode;
  CourseTile(this.id, this.courseCode, this.courseName);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () async {
        HandleNetworking handleNetworking = HandleNetworking();
        bool res = await handleNetworking.deleteCourse(id);
        if (res) {
          Toast.show("Successfully deleted course",
              duration: Toast.lengthLong, gravity: Toast.bottom);
        } else {
          Toast.show("OOPS! Some error occured occur while deleting a course",
              duration: Toast.lengthLong, gravity: Toast.bottom);
        }
      },
      onTap: () {
        print(id);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage(id)),
        );
      },
      child: Card(
        child: ListTile(
          leading: Icon(Icons.library_books),
          title: Text(courseName),
          subtitle: Text(courseCode),
        ),
      ),
    );
  }
}
