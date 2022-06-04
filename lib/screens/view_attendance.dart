import 'package:flutter/material.dart';
import 'package:ihrd/Models/singe_student.dart';
import 'package:ihrd/utils/constant.dart';

import '../utils/network_service.dart';

class AttendanceView extends StatefulWidget {
  AttendanceView({Key? key, required this.student}) : super(key: key);
  final SingleStudent student;

  @override
  State<AttendanceView> createState() => _AttendanceViewState();
}

class _AttendanceViewState extends State<AttendanceView> {
  int absent = 0, present = 0, total = 0;

  @override
  void initState() {
    getabsent().then((absentData) {
      getpresent().then((presentData) {
        setState(() {
          absent = int.parse(absentData['count']);
          present = int.parse(presentData['count']);
          total = absent + present;
        });
        print('$absent $present');
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Container(
        width: 300,
        height: 200,
        padding: new EdgeInsets.all(10.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.red,
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.file_open, size: 60),
                title: Text(widget.student.name!,
                    style: TextStyle(fontSize: 30.0)),
                subtitle: Text(
                    'Reg no : ${widget.student.regNo}\nRoll no : ${widget.student.rollNo}\nPresend days : ${present}\nAbsent days : ${absent}\nTotal days : ${total}',
                    style: TextStyle(fontSize: 18.0)),
              ),
            ],
          ),
        ),
      )),
    );
  }

  Future<Map<String, dynamic>> getpresent() async {
    final json = await getData("view_attandance_present.php",
        params: {"reg_no": widget.student.regNo});
    print(json);
    return json;
  }

  Future<Map<String, dynamic>> getabsent() async {
    final json = await getData("view_attandance_absent.php",
        params: {"reg_no": widget.student.regNo});
    print(json);
    return json;
  }
}
