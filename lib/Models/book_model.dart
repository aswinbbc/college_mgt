class Book {
  String? bookName;
  String? author;
  String? price;
  String? bookEdition;
  String? shelfNo;

  Book(
      {this.bookName, this.author, this.price, this.bookEdition, this.shelfNo});

  Book.fromJson(Map<String, dynamic> json) {
    bookName = json['book_name'];
    author = json['author'];
    price = json['price'];
    bookEdition = json['book_edition'];
    shelfNo = json['shelf_no '];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['book_name'] = this.bookName;
    data['author'] = this.author;
    data['price'] = this.price;
    data['book_edition'] = this.bookEdition;
    data['shelf_no '] = this.shelfNo;
    return data;
  }
}
