import 'package:flutter/material.dart';
import 'package:ihrd/Models/book_model.dart';

import '../Models/mark_model.dart';
import '../utils/network_service.dart';

class ViewLibrary extends StatefulWidget {
  const ViewLibrary({Key? key}) : super(key: key);

  @override
  State<ViewLibrary> createState() => _ViewLibraryState();
}

class _ViewLibraryState extends State<ViewLibrary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: getbooks(),
        builder: (context, AsyncSnapshot<List<Book>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Book book = snapshot.data!.elementAt(index);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    child: ListTile(
                      leading: Icon(Icons.book, size: 50),
                      title: Text(book.bookName!),
                      subtitle: Text(
                          'author : ${book.author!}\nedition : ${book.bookEdition!}\nShelf number : ${book.shelfNo!}\nBook status : ${book.status!}'),
                      trailing: Text('${book.price!}Rs'),
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
      ),
    );
  }

  Future<List<Book>> getbooks() async {
    List json = await getData(
      "view_library.php",
    );
    print(json);
    return json.map((e) => Book.fromJson(e)).toList();
  }
}
