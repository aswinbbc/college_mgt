import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';


class EnrolledStudentTile extends StatelessWidget {

  final String enrolledStudentRollNumber;
  final String enrolledStudentName;
  final double attendanceRatio;

  EnrolledStudentTile(this.enrolledStudentRollNumber,this.enrolledStudentName,this.attendanceRatio);
  @override
  Widget build(BuildContext context) {
      return Card(
        child: ListTile(
          leading: Icon(Icons.account_circle_rounded),
          title: Text(enrolledStudentName),
          subtitle: Text(enrolledStudentRollNumber),
          trailing:  CircularPercentIndicator(
            radius: 50.0,
            lineWidth: 6.0,
            animation: true,
            percent: attendanceRatio,
            center:  Text(
              (attendanceRatio * 100).toString() + "%",
              style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.black,
          ),
        ),

      );
    // return new Container(
    //   padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
    //   height: 160,
    //   width: double.maxFinite,
    //   child: Card(
    //     child: Row(
    //       children: [
    //         Column(
    //           children: [
    //             Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Text(enrolledStudentName),
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Text(enrolledStudentRollNumber),
    //             ),
    //           ],
    //         ),
    //

    //       ],
    //     ),
    //     elevation: 5,
    //   ),
    // );
  }
}
