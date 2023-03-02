class QuoteRecord {
  final int id;
  final String text;
  final String author;

  const QuoteRecord(
      {required this.id, required this.text, required this.author});

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
