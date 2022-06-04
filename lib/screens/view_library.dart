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
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            child: new ListTile(
              leading: new Icon(Icons.search),
              title: new TextField(
                controller: searchController,
                decoration: new InputDecoration(
                    hintText: 'Search', border: InputBorder.none),
                onChanged: onSearchTextChanged,
              ),
              trailing: new IconButton(
                icon: new Icon(Icons.cancel),
                onPressed: () {
                  searchController.clear();
                  onSearchTextChanged('');
                },
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: getbooks(),
              builder: (context, AsyncSnapshot<List<Book>> snapshot) {
                if (snapshot.hasData) {
                  List<Book> books = [];
                  if (searchController.text.isEmpty) {
                    books = snapshot.data!;
                  } else {
                    snapshot.data!.forEach((element) {
                      if (element.bookName!.contains(searchController.text) ||
                          element.author!.contains(searchController.text)) {
                        books.add(element);
                      }
                    });
                  }
                  books = books.toSet().toList();
                  return ListView.builder(
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      Book book = books.elementAt(index);
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
          ),
        ],
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

  List<Book> _searchResult = [];
  void onSearchTextChanged(String value) async {
    _searchResult.clear();
    if (value.isEmpty) {
      setState(() {});
      return;
    } else {
      setState(() {});
    }
  }
}
