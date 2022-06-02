import 'package:flutter/material.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:ihrd/HandleNetworking.dart';
import 'package:ihrd/components/ReusableButton.dart';

class AddCourses extends StatefulWidget {
  @override
  _AddCoursesState createState() => _AddCoursesState();
}

class _AddCoursesState extends State<AddCourses> {
  final HandleNetworking handleNetworking = HandleNetworking();
  String? courseId;
  String? courseName;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              // decoration: BoxDecoration(
              //   color: Colors.white,
              //   borderRadius: BorderRadius.only(
              //     topLeft: Radius.circular(20.0),
              //     topRight: Radius.circular(20.0),
              //   ),
              // ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 30.0),
                    child: Text(
                      'Add New Course',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextField(
                    onChanged: (String value) {
                      courseId = value;
                    },
                    obscureText: false,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "CourseId",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0.0, vertical: 30.0),
                    child: TextField(
                      onChanged: (String value) {
                        courseName = value;
                      },
                      obscureText: false,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Course Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                  Builder(builder: (BuildContext context) {
                    return GestureDetector(
                      child: ReusableButton('Add course'),
                      onTap: () async {
                        if (courseName == null || courseId == null) {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text("Invalid input"),
                          ));

                          return;
                        }

                        setState(() {
                          isLoading = true;
                        });

                        bool isAdded = await handleNetworking.addCourse(
                            courseName!, courseId!);

                        setState(() {
                          isLoading = false;
                        });

                        if (isAdded) {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text("Course is added"),
                          ));
                          Navigator.pop(context);
                        } else {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text(
                                "OOPS! Some error occur. Please try again later"),
                          ));
                        }
                      },
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
