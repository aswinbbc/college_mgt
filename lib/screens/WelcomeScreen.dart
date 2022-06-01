import 'package:flutter/material.dart';
import 'package:professor_interface/components/ReusableButton.dart';
import 'package:professor_interface/screens/RegisterScreen.dart';
import 'package:professor_interface/screens/LoginScreen.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 58.0),
              child: Lottie.network(
                "https://assets2.lottiefiles.com/packages/lf20_idcmsfuq.json",
              ),
            ),
          ),
          Center(
            child: Container(
              // color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    // SizedBox(
                    //   height: 155.0,
                    //   child: Image.asset(
                    //     "images/logo.png",
                    //     fit: BoxFit.contain,
                    //   ),
                    // ),
                    SizedBox(height: 45.0),
                    Text(
                      "IHRD",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 35.0),
                    // GestureDetector(
                    //   child: ReusableButton('Register'),
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(builder: (context) => RegisterScreen()),
                    //     );
                    //   },
                    // ),
                    SizedBox(height: 25.0),
                    GestureDetector(
                      child: ReusableButton('Login'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen(msg: ' ')),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
