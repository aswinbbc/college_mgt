import 'package:flutter/material.dart';
import 'package:ihrd/screens/add_mark.dart';

import '../Models/student_model.dart';
import '../components/dep_dropdown.dart';
import '../components/sem_dropdown.dart';
import '../utils/network_service.dart';

class TeacherViewStudent extends StatefulWidget {
  const TeacherViewStudent({Key? key}) : super(key: key);

  @override
  State<TeacherViewStudent> createState() => _TeacherViewStudentState();
}

class _TeacherViewStudentState extends State<TeacherViewStudent> {
  bool isLoaded = false;
  String semester = "", department = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Card(
                            child: ListTile(
                              leading: Icon(Icons.person, size: 50),
                              title: Text(student.name!),
                              subtitle: Text('Register No : ${student.regNo!}'),
                              trailing: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AddMark(
                                                department: department,
                                                name: student.name!,
                                                regno: student.regNo!,
                                                sem: semester,
                                              )));
                                },
                                child: Text("Add mark"),
                              ),
                            ),
                            elevation: 8,
                            shadowColor: Colors.green,
                            shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
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
    return json.map((e) => Student.fromJson(e)).toList();
  }
}
