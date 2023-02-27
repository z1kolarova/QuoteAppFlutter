class Quote {
  String text;
  String author;

  Quote(this.text, this.author);

  static Quote fromMap(map) {
    return Quote(map['q'], map['a']);
  }
}
