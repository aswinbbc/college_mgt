import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:ihrd/HandleNetworking.dart';
import 'package:ihrd/Models/FutureResponse.dart';
import 'package:ihrd/components/ReusableButton.dart';

import 'LoginScreen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final HandleNetworking handleNetworking = HandleNetworking();
  String? email;
  String? password;
  String? name;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
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
                      name = value;
                    },
                    obscureText: false,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Name",
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
                      child: ReusableButton('Register'),
                      onTap: () async {
                        if (email == null || name == null || password == null) {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text("Invalid input"),
                          ));

                          return;
                        }

                        setState(() {
                          isLoading = true;
                        });

                        FutureResponse result = await handleNetworking
                            .registerFaculty(email!, name!, password!);
                        setState(() {
                          isLoading = false;
                        });
                        if (result != null) {
                          if (result.err) {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(result.msg),
                            ));
                          } else {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(result.msg),
                            ));
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen(
                                      msg:
                                          "Verification email sent. First verify your email than login to AMS")),
                            );
                          }
                        } else {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text(
                                "something went wrong please try again later"),
                          ));
                        }
                      },
                    );
                  }),
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
}
