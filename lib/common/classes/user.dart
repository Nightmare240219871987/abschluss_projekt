import 'transaction.dart';

class User {
  String email;
  String uid;
  double currentSaved;
  List<Transaction> transactions = [];

  User({required this.email, required this.uid, this.currentSaved = 0});
}
