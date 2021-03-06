import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ihrd/Models/attendance_model.dart';
import 'package:ihrd/Models/student_model.dart';
import 'package:ihrd/components/dep_dropdown.dart';
import 'package:ihrd/components/sem_dropdown.dart';

import '../components/attendance_component.dart';
import '../utils/network_service.dart';

class AddAttendace extends StatefulWidget {
  AddAttendace({Key? key}) : super(key: key);

  @override
  State<AddAttendace> createState() => _AddAttendaceState();
}

class _AddAttendaceState extends State<AddAttendace> {
  bool isLoaded = false;
  String semester = "", department = "";
  List<AttendanceModel> attendance = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Visibility(
        visible: isLoaded,
        child: ElevatedButton(
            child: Text('submit'),
            onPressed: () {
              addAttendaces();
            }),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: depDropdown(onChange: (dep) {
                  setState(() {
                    department = dep;
                  });
                }),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: SemDropdown(onChange: (sem) {
                  setState(() {
                    semester = sem;
                  });
                }),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: ElevatedButton(
                    child: Text('load'),
                    onPressed: () {
                      setState(() {
                        isLoaded = true;
                      });
                    }),
              ),
            ],
          ),
        ),
        Expanded(
          child: Visibility(
              visible: isLoaded,
              child: FutureBuilder(
                future: getStudents(),
                builder: (context, AsyncSnapshot<List<Student>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        Student student = snapshot.data!.elementAt(index);
                        return AttendanceCard(
                          attendanceModel: attendance.elementAt(index),
                          student: student,
                          onChange: (value) {
                            attendance.elementAt(index).attendance = value;
                          },
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: Text("Loading"),
                    );
                  }
                },
              )),
        )
      ]),
    );
  }

  Future<List<Student>> getStudents() async {
    List json = await getData("view_student_list.php",
        params: {"department": department, "sem": semester});
    print(json);
    attendance = [];
    final list = json.map((e) {
      Student student = Student.fromJson(e);
      attendance.add(AttendanceModel(id: student.regNo));
      return student;
    }).toList();

    return list;
  }

  addAttendaces() async {
    attendance.forEach((element) async {
      Fluttertoast.showToast(msg: "Adding attendance, Please wait..");
      final result = await getData("add_attendance.php", params: {
        "sem": semester,
        "department": department,
        "subject": "nil",
        "reg_no": element.id,
        "attend": element.attendance! ? "present" : "absent",
      });
      print(result);
    });
  }
}
