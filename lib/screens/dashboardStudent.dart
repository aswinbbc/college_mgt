import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ihrd/Models/singe_student.dart';
import 'package:ihrd/Models/teacher_model.dart';
import 'package:ihrd/screens/add_attendance.dart';
import 'package:ihrd/screens/add_feedback.dart';
import 'package:ihrd/screens/add_notifcation.dart';
import 'package:ihrd/screens/coursesList.dart';
import 'package:ihrd/screens/view_library.dart';
import 'package:ihrd/screens/view_mark.dart';
import 'package:ihrd/screens/view_notification.dart';
import 'package:ihrd/screens/view_students.dart';
import 'package:ihrd/utils/constant.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/network_service.dart';

class StudentDashboard extends StatefulWidget {
  StudentDashboard({Key? key}) : super(key: key);

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  String regno = "1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 155.0,
            child: Image.asset(
              "images/logo.png",
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 45.0),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Card(
              child: ListTile(title: Text("view profile")),
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => ViewStudent()));
            },
            child: Card(
              child: ListTile(title: Text("View attendance")),
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ViewLibrary()));
            },
            child: Card(
              child: ListTile(title: Text("View Library books")),
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ViewMark(
                            regno: regno,
                          )));
            },
            child: Card(
              child: ListTile(title: Text("view Mark")),
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddFeedback()));
            },
            child: Card(
              child: ListTile(title: Text("Add feedback")),
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NotificationView()));
            },
            child: Card(
              child: ListTile(title: Text("view notification")),
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () {
              _showMyDialog(context);
            },
            child: Card(
              child: ListTile(title: Text("logout")),
            ),
          ),
        ],
      )),
      appBar: AppBar(
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
      backgroundColor: Colors.green[300],
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Lottie.network(
                'https://assets1.lottiefiles.com/private_files/lf30_kvdn44jg.json',
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Lottie.network(
                'https://assets1.lottiefiles.com/packages/lf20_nxsyeqbd.json',
              ),
            ),
            Center(
              child: FutureBuilder(
                future: getProfile(),
                builder: (context, AsyncSnapshot<SingleStudent> snapshot) {
                  if (snapshot.hasData) {
                    regno = snapshot.data!.regNo!;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          snapshot.data!.name!,
                          style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          'Welcome',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'SourceSansPro',
                            color: Colors.red[400],
                            letterSpacing: 2.5,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                          width: 200,
                          child: Divider(
                            color: Colors.teal[100],
                          ),
                        ),
                        Text("Keep visiting ihrd.com for more contents"),
                        Card(
                            color: Colors.white,
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 25.0),
                            child: ListTile(
                              leading: Icon(
                                Icons.phone,
                                color: Colors.teal[900],
                              ),
                              title: Text(
                                '+91 ${snapshot.data!.mobile}',
                                style: TextStyle(
                                    fontFamily: 'BalooBhai', fontSize: 20.0),
                              ),
                            )),
                        Card(
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 25.0),
                          child: ListTile(
                            leading: Icon(
                              Icons.cake,
                              color: Colors.teal[900],
                            ),
                            title: Text(
                              '${snapshot.data!.address}',
                              style: TextStyle(
                                  fontSize: 20.0, fontFamily: 'Neucha'),
                            ),
                          ),
                        ),
                        Card(
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 25.0),
                          child: ListTile(
                            leading: Icon(
                              Icons.email,
                              color: Colors.teal[900],
                            ),
                            title: Text(
                              '${snapshot.data!.email}',
                              style: TextStyle(
                                  fontSize: 20.0, fontFamily: 'Neucha'),
                            ),
                          ),
                        ),
                        Card(
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 25.0),
                          child: ListTile(
                            leading: Icon(
                              Icons.email,
                              color: Colors.teal[900],
                            ),
                            title: Text(
                              'Reg No : ${snapshot.data!.regNo}',
                              style: TextStyle(
                                  fontSize: 20.0, fontFamily: 'Neucha'),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Center(
                      child: Text("Loading.."),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

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

  Future<SingleStudent> getProfile() async {
    final id = await Constants.UserId;
    final json = await getData("single_student.php", params: {"id": id});
    print(json);
    return SingleStudent.fromJson(json);
  }
}
