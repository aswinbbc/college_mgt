import 'package:flutter/material.dart';
import 'package:ihrd/Models/mark_model.dart';
import 'package:ihrd/utils/network_service.dart';

class ViewMark extends StatefulWidget {
  const ViewMark({Key? key, required this.regno}) : super(key: key);
  final String regno;
  @override
  State<ViewMark> createState() => _ViewMarkState();
}

class _ViewMarkState extends State<ViewMark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 28.0),
          child: Text(
            "View Mark",
            style: TextStyle(
              fontFamily: 'SourceSansPro',
              fontSize: 25,
            ),
          ),
        ),
        FutureBuilder(
          future: getMark(),
          builder: (context, AsyncSnapshot<Mark> snapshot) {
            if (snapshot.hasData) {
              Mark mark = snapshot.data!;
              return Container(
                margin: EdgeInsets.all(20),
                child: Table(
                  defaultColumnWidth: FixedColumnWidth(120.0),
                  border: TableBorder.all(
                      color: Colors.black, style: BorderStyle.solid, width: 2),
                  children: [
                    TableRow(children: [
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child:
                              Text('Subject', style: TextStyle(fontSize: 20.0)),
                        )
                      ]),
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text('Mark', style: TextStyle(fontSize: 20.0)),
                        )
                      ]),
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child:
                              Text('Total', style: TextStyle(fontSize: 20.0)),
                        )
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(mark.sub1!),
                        )
                      ]),
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(mark.mark1!),
                        )
                      ]),
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('100*'),
                        )
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(mark.sub2!),
                        )
                      ]),
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(mark.mark2!),
                        )
                      ]),
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('100*'),
                        )
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(mark.sub3!),
                        )
                      ]),
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(mark.mark3!),
                        )
                      ]),
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('100*'),
                        )
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(mark.sub4!),
                        )
                      ]),
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(mark.mark4!),
                        )
                      ]),
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('100*'),
                        )
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(mark.sub5!),
                        )
                      ]),
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(mark.mark5!),
                        )
                      ]),
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('100*'),
                        )
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(mark.sub6!),
                        )
                      ]),
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(mark.mark6!),
                        )
                      ]),
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('100*'),
                        )
                      ]),
                    ]),
                  ],
                ),
              );
            } else {
              return Center(
                child: Text("not published"),
              );
            }
          },
        )
      ])),
    );
  }

  Future<Mark> getMark() async {
    List json =
        await getData("view_mark.php", params: {"reg_no": widget.regno});
    return Mark.fromJson(json.last);
  }
}
