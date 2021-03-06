import 'package:flutter/material.dart';

import '../Models/student_model.dart';
import '../components/dep_dropdown.dart';
import '../components/sem_dropdown.dart';
import '../utils/network_service.dart';

class ViewStudent extends StatefulWidget {
  const ViewStudent({Key? key}) : super(key: key);

  @override
  State<ViewStudent> createState() => _ViewStudentState();
}

class _ViewStudentState extends State<ViewStudent> {
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
                              subtitle: Text(
                                  'mobile : ${student.mobile!}\nemail : ${student.email!}'),
                              trailing: Text(student.regNo!),
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
