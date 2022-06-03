import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ihrd/utils/constant.dart';

import '../utils/network_service.dart';

class AddFeedback extends StatefulWidget {
  AddFeedback({Key? key}) : super(key: key);

  @override
  State<AddFeedback> createState() => _AddFeedbackState();
}

class _AddFeedbackState extends State<AddFeedback> {
  final feedbackController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 50,
          ),
          Text(
            "Add Feedback",
            style: TextStyle(
              fontFamily: 'SourceSansPro',
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Card(
            color: Colors.blueGrey,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: feedbackController,
                maxLines: 25, //or null
                decoration: InputDecoration.collapsed(
                    hintText: "Please enter your valueable feedback..."),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: addfeed,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28.0, vertical: 20),
                child: Text("Add feddback"),
              ))
        ]),
      ),
    );
  }

  void addfeed() async {
    if (feedbackController.text.isEmpty) {
      Fluttertoast.showToast(msg: "feedback must be filled..");
      return;
    }
    Fluttertoast.showToast(msg: "Notification added..");
    final id = await Constants.UserId;
    final result = await getData("add_feedback.php", params: {
      "id": id,
      "content": feedbackController.text,
    });
  }
}
