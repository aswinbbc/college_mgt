import 'package:flutter/material.dart';

import '../Models/attendance_model.dart';
import '../Models/student_model.dart';

class AttendanceCard extends StatefulWidget {
  AttendanceCard(
      {Key? key,
      required this.student,
      required this.attendanceModel,
      required this.onChange})
      : super(key: key);
  Student student;
  Function(bool) onChange;
  AttendanceModel attendanceModel;

  @override
  State<AttendanceCard> createState() => _AttendanceCardState();
}

class _AttendanceCardState extends State<AttendanceCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SwitchListTile(
        value: widget.attendanceModel.attendance!,
        onChanged: ((value) {
          setState(() {
            widget.attendanceModel.attendance = value;
          });
        }),
        title: Text(widget.student.name!),
      ),
    );
  }
}
