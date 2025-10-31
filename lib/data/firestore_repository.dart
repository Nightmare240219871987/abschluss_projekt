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
          "continuous": transaction.continuous,
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
      DocumentSnapshot<Map<String, dynamic>> user = await FirebaseFirestore
          .instance
          .collection("users")
          .doc(_currentUser!.uid)
          .get();
      _currentUser!.currentSaved = (user["currentSaved"] as num).toDouble();
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
            (t.date.month <= month || t.date.year < DateTime.now().year)) {
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
        if (t.continuous) {
          if (t.transactionType == ta.TransactionType.outgoing &&
              (t.date.month <= month || t.date.year < DateTime.now().year)) {
            sumOfOutgoing += t.price;
          }
          if (t.transactionType == ta.TransactionType.saving &&
              (t.date.month <= month || t.date.year < DateTime.now().year)) {
            sumOfOutgoing += t.price;
          }
        } else {
          if (t.transactionType == ta.TransactionType.outgoing &&
              (t.date.month == month)) {
            sumOfOutgoing += t.price;
          }
          if (t.transactionType == ta.TransactionType.saving &&
              (t.date.month == month)) {
            sumOfOutgoing += t.price;
          }
        }
      }
    }
    return sumOfOutgoing;
  }

  @override
  double getSumOfSaved() {
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
          "continuous": transaction.continuous,
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

  @override
  Future<void> deleteUser() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    QuerySnapshot transactions = await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .collection("transactions")
        .get();
    for (QueryDocumentSnapshot t in transactions.docs) {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .collection("transactions")
          .doc(t.id)
          .delete();
    }

    await FirebaseFirestore.instance.collection("users").doc(uid).delete();

    try {
      await FirebaseAuth.instance.currentUser!.delete();
    } on FirebaseAuthException {
      rethrow;
    }

    _currentUser = null;
    notifyListeners();
  }

  @override
  Future<void> addCurrentSaved(double saved) async {
    _currentUser!.currentSaved += saved;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(_currentUser!.uid)
        .update({"currentSaved": _currentUser!.currentSaved});
    await getAllTransactions();
  }

  @override
  double readCurrentSaved() {
    return _currentUser!.currentSaved;
  }
}
