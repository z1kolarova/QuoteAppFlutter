class QuoteRecord {
  int id;
  String text;
  String author;

  QuoteRecord({required this.id, required this.text, required this.author});

  Map<String, dynamic> toMapWithID() {
    return {
      'id': id,
      'text': text,
      'author': author,
    };
  }

  Map<String, dynamic> toMapWithoutID() {
    return {
      'text': text,
      'author': author,
    };
  }
}
