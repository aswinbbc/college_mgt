import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ihrd/utils/network_service.dart';
import 'package:lottie/lottie.dart';

class AddMark extends StatefulWidget {
  const AddMark(
      {Key? key,
      required this.regno,
      required this.department,
      required this.name,
      required this.sem})
      : super(key: key);
  final String regno, sem, department, name;
  @override
  State<AddMark> createState() => _AddMarkState();
}

class _AddMarkState extends State<AddMark> {
  TextEditingController sub1 = TextEditingController(),
      sub6 = TextEditingController(),
      sub2 = TextEditingController(),
      sub3 = TextEditingController(),
      sub4 = TextEditingController(),
      sub5 = TextEditingController();
  TextEditingController mark1 = TextEditingController(),
      mark2 = TextEditingController(),
      mark3 = TextEditingController(),
      mark4 = TextEditingController(),
      mark5 = TextEditingController(),
      mark6 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Text(
              "Add Mark",
              style: TextStyle(
                fontFamily: 'SourceSansPro',
                fontSize: 25,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Name : ${widget.name}"),
                  Text("Reg no : ${widget.regno}"),
                ]),
          ),
        ),
        Expanded(
            flex: 8,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: sub1,
                              decoration: InputDecoration.collapsed(
                                  hintText: "Enter subject 1"),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: mark1,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration.collapsed(
                                  hintText: "Enter mark 1"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: sub2,
                              decoration: InputDecoration.collapsed(
                                  hintText: "Enter subject 2"),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: mark2,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration.collapsed(
                                  hintText: "Enter mark 2"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: sub3,
                              decoration: InputDecoration.collapsed(
                                  hintText: "Enter subject 3"),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: mark3,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration.collapsed(
                                  hintText: "Enter mark 3"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: sub4,
                              decoration: InputDecoration.collapsed(
                                  hintText: "Enter subject 4"),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: mark4,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration.collapsed(
                                  hintText: "Enter mark 4"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: sub5,
                              decoration: InputDecoration.collapsed(
                                  hintText: "Enter subject 5"),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: mark5,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration.collapsed(
                                  hintText: "Enter mark 5"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: sub6,
                              decoration: InputDecoration.collapsed(
                                  hintText: "Enter subject 6"),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: mark6,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration.collapsed(
                                  hintText: "Enter mark 6"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
        // Expanded(
        //     child: Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 18.0),
        //   child:
        // )),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text("Add Mark"),
        ),
        onPressed: sendMark,
      ),
    );
  }

  sendMark() async {
    if (sub1.text.isEmpty ||
        mark1.text.isEmpty ||
        sub2.text.isEmpty ||
        mark2.text.isEmpty ||
        sub3.text.isEmpty ||
        mark3.text.isEmpty ||
        sub4.text.isEmpty ||
        mark4.text.isEmpty ||
        sub5.text.isEmpty ||
        mark5.text.isEmpty ||
        sub6.text.isEmpty ||
        mark6.text.isEmpty) {
      Fluttertoast.showToast(msg: "All fields must be filled..");
      return;
    }

    if ((int.parse(mark1.text.toString()) < 100) ||
        (int.parse(mark2.text.toString()) < 100) ||
        (int.parse(mark3.text.toString()) < 100) ||
        (int.parse(mark4.text.toString()) < 100) ||
        (int.parse(mark5.text.toString()) < 100) ||
        (int.parse(mark6.text.toString()) < 100)) {
      Fluttertoast.showToast(msg: "All fields must be valid..");
      return;
    }
    Fluttertoast.showToast(msg: "internal mark added successfully..");
    final result = await getData("add_mark.php", params: {
      "mark1": mark1.text,
      "sub1": sub1.text,
      "mark2": mark2.text,
      "sub2": sub2.text,
      "mark3": mark3.text,
      "sub3": sub3.text,
      "mark4": mark4.text,
      "sub4": sub4.text,
      "mark5": mark5.text,
      "sub5": sub5.text,
      "mark6": mark6.text,
      "sub6": sub6.text,
      "reg_no": widget.regno,
      "sem": widget.sem,
      "department": widget.department,
      "name": widget.name,
    });
    mark1.clear();
    mark2.clear();
    mark3.clear();
    mark4.clear();
    mark5.clear();
    mark6.clear();
    sub1.clear();
    sub2.clear();
    sub3.clear();
    sub4.clear();
    sub5.clear();
    sub6.clear();
  }
}
