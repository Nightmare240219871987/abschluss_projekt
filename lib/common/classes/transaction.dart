enum TransactionType { ausgabe, einnahme, ersparnis }

class Transaction {
  String title;
  String description;
  String category;
  double price;
  TransactionType transactionType;
  bool continuous;
  DateTime date;
  String receipient;
  String sender;

  Transaction({
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.transactionType,
    required this.continuous,
    required this.date,
    required this.receipient,
    required this.sender,
  });
}
