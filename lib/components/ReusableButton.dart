import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final String title;
  ReusableButton(this.title);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.0,
      height: 70.0,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Colors.black,
        elevation: 10.0,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(
            child: Text(
              '$title',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}