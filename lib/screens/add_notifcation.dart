import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ihrd/utils/network_service.dart';

class AddNotification extends StatefulWidget {
  const AddNotification({Key? key}) : super(key: key);

  @override
  State<AddNotification> createState() => _AddNotificationState();
}

class _AddNotificationState extends State<AddNotification> {
  TextEditingController titleController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: addNoti,
          child: Icon(Icons.add),
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text(
              "Add notification",
              style: TextStyle(
                fontFamily: 'SourceSansPro',
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Card(
                color: Colors.grey,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: titleController,
                    decoration: InputDecoration.collapsed(
                        hintText: "Enter your title here"),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Card(
                color: Color.fromRGBO(158, 158, 158, 1),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: messageController,
                    maxLines: 25, //or null
                    decoration: InputDecoration.collapsed(
                        hintText: "Enter your text here"),
                  ),
                )),
          ],
        ));
  }

  void addNoti() async {
    if (titleController.text.isEmpty || messageController.text.isEmpty) {
      Fluttertoast.showToast(msg: "All fields must be filled..");
      return;
    }
    Fluttertoast.showToast(msg: "Notification added..");
    final result = await getData("add_notification.php", params: {
      "id": titleController.text,
      "content": messageController.text,
    });
  }
}
