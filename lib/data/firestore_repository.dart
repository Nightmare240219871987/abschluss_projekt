import 'package:abschluss_projekt/common/classes/transaction.dart' as ta;
import 'package:abschluss_projekt/common/classes/user.dart' as us;
import 'package:abschluss_projekt/data/database_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class FirestoreRepository extends ChangeNotifier implements DatabaseRepository {
  us.User? _currentUser;
  @override
  Future<void> createTransaction(ta.Transaction transaction) async {
    String tt = "";
    switch (transaction.transactionType) {
      case ta.TransactionType.outgoing:
        tt = "Ausgaben";
      case ta.TransactionType.incoming:
        tt = "Einnahmen";
      case ta.TransactionType.saving:
        tt = "Erspartes";
    }

    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("transactions")
        .add({
          "continuous": true,
          "date": Timestamp.fromDate(transaction.date),
          "description": transaction.description,
          "price": transaction.price,
          "receipient": transaction.receipient,
          "sender": transaction.sender,
          "title": transaction.title,
          "transactionType": tt,
        });
    await getAllTransactions();
  }

  @override
  Future<void> deleteTransaction(String id) async {
    if (_currentUser != null) {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(_currentUser!.uid)
          .collection("transactions")
          .doc(id)
          .delete();
      await getAllTransactions();
    }
  }

  @override
  Future<List<ta.Transaction>> getAllTransactions() async {
    List<ta.Transaction> transactions = [];
    if (_currentUser != null) {
      QuerySnapshot<Map<String, dynamic>> list = await FirebaseFirestore
          .instance
          .collection("users")
          .doc(_currentUser!.uid)
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
      _currentUser!.transactions = transactions;
    }
    notifyListeners();
    return transactions;
  }

  @override
  double getAvailable(int month) {
    return getSumOfIncoming(month) - getSumOfOutgoing(month);
  }

  @override
  double getSumOfIncoming(int month) {
    double sumOfIncoming = 0;
    if (_currentUser != null) {
      for (ta.Transaction t in _currentUser!.transactions) {
        if (t.transactionType == ta.TransactionType.incoming &&
            t.date.month == month) {
          sumOfIncoming += t.price;
        }
      }
    }
    return sumOfIncoming;
  }

  @override
  double getSumOfOutgoing(int month) {
    double sumOfOutgoing = 0;
    if (_currentUser != null) {
      for (ta.Transaction t in _currentUser!.transactions) {
        if (t.transactionType == ta.TransactionType.outgoing &&
            t.date.month == month) {
          sumOfOutgoing += t.price;
        }
        if (t.transactionType == ta.TransactionType.saving &&
            t.date.month == month) {
          sumOfOutgoing += t.price;
        }
      }
    }
    return sumOfOutgoing;
  }

  @override
  double getSumOfSaved(int month) {
    double sumOfSaved = 0;
    if (_currentUser != null) {
      for (ta.Transaction t in _currentUser!.transactions) {
        if (t.transactionType == ta.TransactionType.saving) {
          sumOfSaved += t.price;
        }
      }
    }
    return sumOfSaved;
  }

  @override
  Future<void> initialize() async {
    await getAllTransactions();
  }

  @override
  Future<ta.Transaction?> readTransaction(String id) async {
    ta.Transaction? transaction;
    if (_currentUser != null) {
      for (ta.Transaction t in _currentUser!.transactions) {
        if (t.id == id) {
          transaction = t;
        }
      }
    }
    return transaction;
  }

  @override
  Future<void> updateTransaction(String id, ta.Transaction transaction) async {
    String tt = "";
    switch (transaction.transactionType) {
      case ta.TransactionType.outgoing:
        tt = "Ausgaben";
      case ta.TransactionType.incoming:
        tt = "Einnahmen";
      case ta.TransactionType.saving:
        tt = "Erspartes";
    }

    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("transactions")
        .doc(id)
        .update({
          "continuous": true,
          "date": Timestamp.fromDate(transaction.date),
          "description": transaction.description,
          "price": transaction.price,
          "receipient": transaction.receipient,
          "sender": transaction.sender,
          "title": transaction.title,
          "transactionType": tt,
        });
    await getAllTransactions();
  }

  @override
  void setUser(us.User user) {
    _currentUser = user;
  }

  @override
  us.User getUser() {
    return _currentUser ?? us.User(email: "", uid: "");
  }
}
