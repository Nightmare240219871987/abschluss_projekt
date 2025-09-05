enum TransactionType { outgoing, incoming, saving }

class Transaction {
  String id;
  String title;
  String description;
  double price;
  TransactionType transactionType;
  bool continuous;
  DateTime date;
  String receipient;
  String sender;

  Transaction({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.transactionType,
    required this.continuous,
    required this.date,
    required this.receipient,
    required this.sender,
  });
}
