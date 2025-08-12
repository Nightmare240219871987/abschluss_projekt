class Transaction {
  late String _title;
  late String _description;
  late String _category;
  late double _price;

  // TODO: ENUM was ist es
  // TODO: Bool Regelmäsig
  // TODO: Date Datum für die zuordnung
  // TODO: receipient Empfänger
  // TODO: Sender Sender
  Transaction(String title, String description, String category, double price) {
    this._title = title;
    this._description = description;
    this._category = category;
    this._price = price;
  }

  String get title {
    return this._title;
  }

  void set title(String title) {
    this._title = title;
  }

  String get description {
    return this._description;
  }

  void set description(String description) {
    this._description = description;
  }

  String get category {
    return this._category;
  }

  void set category(String category) {
    this._category = category;
  }

  double get price {
    return this._price;
  }

  void set price(double price) {
    this._price = price;
  }

  // Konvertierung in JSON Format
  Map<String, dynamic> toJson() => {
    "_title": _title,
    "_description": _description,
    "_category": _category,
    "_price": _price,
  };
}
