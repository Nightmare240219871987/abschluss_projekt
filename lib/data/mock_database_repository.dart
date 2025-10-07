import '../common/classes/transaction.dart';
import 'database_repository.dart';
import '../common/classes/user.dart';

class MockDatabaseRepository implements DatabaseRepository {
  final User _currentUser = User(email: "", uid: "");

  @override
  Future<void> initialize() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _currentUser.transactions.clear();
    _currentUser.transactions.add(
      Transaction(
        id: "1",
        title: "Miete",
        description: "Mietkosten",
        price: 800,
        transactionType: TransactionType.outgoing,
        continuous: true,
        date: DateTime.now(),
        receipient: "Clara",
        sender: "Marcus",
      ),
    );
    _currentUser.transactions.add(
      Transaction(
        id: "2",
        title: "Telekom",
        description: "Internet und Festnetz",
        price: 56,
        transactionType: TransactionType.outgoing,
        continuous: true,
        date: DateTime.now(),
        receipient: "Clara",
        sender: "Marcus",
      ),
    );
    _currentUser.transactions.add(
      Transaction(
        id: "3",
        title: "Strom",
        description: "EnviaM",
        price: 144,
        transactionType: TransactionType.outgoing,
        continuous: true,
        date: DateTime.now(),
        receipient: "Clara",
        sender: "Marcus",
      ),
    );
    _currentUser.transactions.add(
      Transaction(
        id: "4",
        title: "ALG I",
        description: "Arbeitslosengeld",
        price: 1067,
        transactionType: TransactionType.incoming,
        continuous: true,
        date: DateTime.now(),
        receipient: "Marcus",
        sender: "Clara",
      ),
    );
    _currentUser.transactions.add(
      Transaction(
        id: "5",
        title: "Kindergeld",
        description: "Kindergeld",
        price: 500,
        transactionType: TransactionType.incoming,
        continuous: true,
        date: DateTime.now(),
        receipient: "Clara",
        sender: "Marcus",
      ),
    );
    _currentUser.transactions.add(
      Transaction(
        id: "6",
        title: "Kinderzuschlag",
        description: "Kinderzuschlag",
        price: 0,
        transactionType: TransactionType.incoming,
        continuous: true,
        date: DateTime.now(),
        receipient: "Clara",
        sender: "Marcus",
      ),
    );
    _currentUser.transactions.add(
      Transaction(
        id: "7",
        title: "Sabrina Taschengeld",
        description: "Taschengeld",
        price: 100,
        transactionType: TransactionType.incoming,
        continuous: true,
        date: DateTime.now(),
        receipient: "Clara",
        sender: "Marcus",
      ),
    );
    for (int i = 0; i < 15; i++) {
      _currentUser.archivements.archivements[i] = false;
    }
  }

  @override
  Future<void> createTransaction(Transaction transaction) async {
    await Future.delayed(Duration(milliseconds: 1000));
    _currentUser.transactions.add(transaction);
  }

  @override
  Future<void> deleteTransaction(String id) async {
    Future.delayed(Duration(milliseconds: 1000));
    _currentUser.transactions.remove(
      _currentUser.transactions.firstWhere((Transaction t) => t.id == id),
    );
  }

  @override
  Future<Transaction> readTransaction(String id) async {
    await Future.delayed(Duration(milliseconds: 1000));
    return _currentUser.transactions.firstWhere((Transaction t) => t.id == id);
  }

  @override
  Future<void> updateTransaction(String id, Transaction transaction) async {
    Future.delayed(Duration(milliseconds: 1000));
    for (int i = 0; i < _currentUser.transactions.length; i++) {
      if (_currentUser.transactions[i].id == id) {
        _currentUser.transactions[i] = transaction;
      }
    }
  }

  @override
  double getAvailable(int month) {
    return getSumOfIncoming(month) - getSumOfOutgoing(month);
  }

  @override
  double getSumOfIncoming(int month) {
    double sumOfIncoming = 0;
    for (Transaction t in _currentUser.transactions) {
      if (t.transactionType == TransactionType.incoming &&
          t.date.month == month) {
        sumOfIncoming += t.price;
      }
    }
    return sumOfIncoming;
  }

  @override
  double getSumOfOutgoing(int month) {
    double sumOfOutgoing = 0;
    for (Transaction t in _currentUser.transactions) {
      if (t.transactionType == TransactionType.outgoing &&
          t.date.month == month) {
        sumOfOutgoing += t.price;
      }
      if (t.transactionType == TransactionType.saving &&
          t.date.month == month) {
        sumOfOutgoing += t.price;
      }
    }
    return sumOfOutgoing;
  }

  @override
  double getSumOfSaved(int month) {
    double sumOfSaved = 0;
    for (Transaction t in _currentUser.transactions) {
      if (t.transactionType == TransactionType.saving) {
        sumOfSaved += t.price;
      }
    }
    return sumOfSaved;
  }

  @override
  Future<List<Transaction>> getAllTransactions() async {
    Future.delayed(Duration(milliseconds: 1000));
    return _currentUser.transactions;
  }

  @override
  void setUser(User user) {
    // TODO: implement setUser
  }

  @override
  User getUser() {
    return _currentUser;
  }
}
