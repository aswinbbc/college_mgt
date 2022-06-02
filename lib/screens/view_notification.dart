import 'package:flutter/material.dart';

import '../Models/notifcation_model.dart';
import '../utils/network_service.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: getNotification(),
        builder: (context, AsyncSnapshot<List<NotficationModel>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                NotficationModel model = snapshot.data!.elementAt(index);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    elevation: 50,
                    shadowColor: Colors.black,
                    color: Colors.greenAccent[100],
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ), //SizedBox
                            Text(
                              model.subject!,
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.green[900],
                                fontWeight: FontWeight.w500,
                              ), //Textstyle
                            ), //Text
                            SizedBox(
                              height: 10,
                            ), //SizedBox
                            Text(
                              '''${model.message}''',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.green[900],
                              ), //Textstyle
                            ), //Text
                            SizedBox(
                              height: 10,
                            ), //SizedBox
                          ],
                        ), //Column
                      ), //Padding
                    ), //SizedBox
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
      ),
    );
  }

  Future<List<NotficationModel>> getNotification() async {
    List json = await getData("view_notification.php");
    print(json);
    return json.map((e) => NotficationModel.fromJson(e)).toList();
  }
}
