import 'package:abschluss_projekt/common/classes/transaction.dart' as ta;
import 'package:abschluss_projekt/common/classes/user.dart' as us;
import 'package:abschluss_projekt/data/database_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreRepository implements DatabaseRepository {
  final us.User _currentUser = us.User(email: "");
  @override
  Future<void> createTransaction(ta.Transaction transaction) {
    // TODO: implement createTransaction
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTransaction(String id) {
    // TODO: implement deleteTransaction
    throw UnimplementedError();
  }

  @override
  Future<List<ta.Transaction>> getAllTransactions() async {
    List<ta.Transaction> transactions = [];
    QuerySnapshot<Map<String, dynamic>> list = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("transactions")
        .get();
    for (QueryDocumentSnapshot<Map<String, dynamic>> doc in list.docs) {
      ta.TransactionType type;
      switch (doc["transactionType"]) {
        case "Ausgaben":
          type = ta.TransactionType.outgoing;
        case "Einnahmen":
          type = ta.TransactionType.incoming;
        case "Erspartes":
          type = ta.TransactionType.saving;
        default:
          throw Exception("kein gültiger Wert für transactionType");
      }
      transactions.add(
        ta.Transaction(
          id: doc.id,
          title: doc["title"],
          description: doc["description"],
          price: (doc["price"] as num).toDouble(),
          transactionType: type,
          continuous: doc["continuous"],
          date: (doc["date"] as Timestamp).toDate(),
          receipient: doc["receipient"],
          sender: doc["sender"],
        ),
      );
    }
    _currentUser.transactions = transactions;
    return transactions;
  }

  @override
  Future<double> getAvailable(int month) async {
    return await getSumOfIncoming(month) - await getSumOfOutgoing(month);
  }

  @override
  Future<us.User> getCurrentUser() async {
    return _currentUser;
  }

  @override
  Future<double> getSumOfIncoming(int month) async {
    double sumOfIncoming = 0;
    for (ta.Transaction t in _currentUser.transactions) {
      if (t.transactionType == ta.TransactionType.incoming &&
          t.date.month == month) {
        sumOfIncoming += t.price;
      }
    }
    return sumOfIncoming;
  }

  @override
  Future<double> getSumOfOutgoing(int month) async {
    double sumOfOutgoing = 0;
    for (ta.Transaction t in _currentUser.transactions) {
      if (t.transactionType == ta.TransactionType.outgoing &&
          t.date.month == month) {
        sumOfOutgoing += t.price;
      }
      if (t.transactionType == ta.TransactionType.saving &&
          t.date.month == month) {
        sumOfOutgoing += t.price;
      }
    }
    return sumOfOutgoing;
  }

  @override
  Future<double> getSumOfSaved(int month) async {
    await Future.delayed(Duration(milliseconds: 1000));
    double sumOfSaved = 0;
    for (ta.Transaction t in _currentUser.transactions) {
      if (t.transactionType == ta.TransactionType.saving) {
        sumOfSaved += t.price;
      }
    }
    return sumOfSaved;
  }

  @override
  Future<void> initialize(us.User user) async {}

  @override
  Future<ta.Transaction> readTransaction(String id) async {
    // TODO: implement readTransaction
    throw UnimplementedError();
  }

  @override
  Future<void> updateTransaction(String id, ta.Transaction transaction) async {
    // TODO: implement updateTransaction
    throw UnimplementedError();
  }
}
