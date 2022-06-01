import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:professor_interface/HandleNetworking.dart';
import 'package:professor_interface/Models/FutureResponse.dart';
import 'package:professor_interface/components/ReusableButton.dart';
import 'package:professor_interface/screens/changePasswordScreen.dart';
import 'package:professor_interface/screens/coursesList.dart';
import 'package:professor_interface/screens/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../utils/network_service.dart';

class LoginScreen extends StatefulWidget {
  final String msg;
  LoginScreen({required this.msg});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final HandleNetworking handleNetworking = HandleNetworking();
  String? email;
  String? password;
  bool isLoading = false;
  BuildContext? myContext;

  @override
  Widget build(BuildContext context) {
    myContext = context;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Center(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    height: 155.0,
                    child: Image.asset(
                      "images/logo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 45.0),
                  TextField(
                    onChanged: (String value) {
                      email = value;
                    },
                    obscureText: false,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 25.0),
                  TextField(
                    onChanged: (String value) {
                      password = value;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  Builder(builder: (BuildContext context) {
                    return GestureDetector(
                      child: ReusableButton('Login'),
                      onTap: () async {
                        if (email == null || password == null) {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text("Invalid input"),
                          ));

                          return;
                        }

                        setState(() {
                          isLoading = true;
                        });

                        login(email!, password!, context);
                      },
                    );
                  }),
                  SizedBox(
                    height: 25.0,
                  ),
                  // Center(
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => ChangePasswordScreen()),
                  //       );
                  //     },
                  //     child: Text(
                  //       'Forget Password',
                  //       style: TextStyle(
                  //         color: Colors.blue,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 18.0),
                    child: Text(
                      widget.msg,
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  login(String? email, String? password, context) {
    getData("logint.php", params: {
      "username": email,
      "password": password,
    }).then((value) async {
      setState(() {
        isLoading = false;
      });
      if (!(value['err'] as bool)) {
        if (value['role'] != 'teacher') {
          Fluttertoast.showToast(msg: "you dont have permission");
          return;
        }
        // Obtain shared preferences.
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_id', value['login_id']);
        await prefs.setBool('isUserLoggedIn', true);
        // await prefs.setString('name', value['name']);
        // await prefs.setString('departmant', value['department']);
        // await prefs.setString('sem', value['sem']);
        // await prefs.setString('reg_no', value['reg_no']);
        // await prefs.setString('mobile', value['mobile']);
        // await prefs.setString('email', value['email']);
        Fluttertoast.showToast(msg: "welcome.");

        Route route = MaterialPageRoute(builder: (context) => Dashboard());
        Navigator.pushReplacement(myContext!, route);
      } else {
        Fluttertoast.showToast(msg: "Something went wrong..");
      }
    });
  }
}
