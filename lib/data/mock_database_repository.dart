import '../common/classes/transaction.dart';
import 'database_repository.dart';
import '../common/classes/user.dart';

class MockDatabaseRepository implements DatabaseRepository {
  List<User> users = [
    User(
      username: "Nightmare2402",
      password: "@42Illuminati",
      email: "Marcusschmidt2402@Hotmail.de",
    ),
  ];

  User? _currentUser;

  @override
  Future<void> initialize(User user) async {
    await Future.delayed(Duration(milliseconds: 1000));
    _currentUser = user;
    _currentUser!.transactions.clear();
    _currentUser!.transactions.add(
      Transaction(
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
    _currentUser!.transactions.add(
      Transaction(
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
    _currentUser!.transactions.add(
      Transaction(
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
    _currentUser!.transactions.add(
      Transaction(
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
    _currentUser!.transactions.add(
      Transaction(
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
    _currentUser!.transactions.add(
      Transaction(
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
    _currentUser!.transactions.add(
      Transaction(
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
      _currentUser!.archivements.archivements[i] = true;
    }
  }

  @override
  Future<void> createTransaction(Transaction transaction) async {
    await Future.delayed(Duration(milliseconds: 1000));
    _currentUser!.transactions.add(transaction);
  }

  @override
  Future<void> createUser(User user) async {
    // TODO: implement createUser
  }

  @override
  Future<void> deleteTransaction(String id) async {
    // TODO: implement deleteTransaction
  }

  @override
  Future<void> deleteUser(String id) async {
    // TODO: implement deleteUser
  }

  @override
  Future<Transaction> readTransaction(String id) async {
    await Future.delayed(Duration(milliseconds: 1000));
    return _currentUser!.transactions[int.parse(id)];
  }

  @override
  Future<User?> readUser(String username) async {
    await Future.delayed(Duration(milliseconds: 1000));
    for (User u in users) {
      if (u.username == username) return u;
    }
    return null;
  }

  @override
  Future<Transaction> updateTransaction(
    String id,
    Transaction transaction,
  ) async {
    // TODO: implement updateTransaction
    throw UnimplementedError();
  }

  @override
  Future<User> updateUser(String id, User user) async {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<double> getAvailable(int month) async {
    await Future.delayed(Duration(milliseconds: 1000));
    return await getSumOfIncoming(month) - await getSumOfOutgoing(month);
  }

  @override
  Future<double> getSumOfIncoming(int month) async {
    await Future.delayed(Duration(milliseconds: 500));
    double sumOfIncoming = 0;
    for (Transaction t in _currentUser!.transactions) {
      if (t.transactionType == TransactionType.incoming &&
          t.date.month == month) {
        sumOfIncoming += t.price;
      }
    }
    return sumOfIncoming;
  }

  @override
  Future<double> getSumOfOutgoing(int month) async {
    await Future.delayed(Duration(milliseconds: 500));
    double sumOfOutgoing = 0;
    for (Transaction t in _currentUser!.transactions) {
      if (t.transactionType == TransactionType.outgoing &&
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
    for (Transaction t in _currentUser!.transactions) {
      if (t.transactionType == TransactionType.saving &&
          t.date.month == month) {
        sumOfSaved += t.price;
      }
    }
    return sumOfSaved;
  }

  @override
  Future<List<Transaction>> getAllTransactions() async {
    Future.delayed(Duration(milliseconds: 1000));
    return _currentUser!.transactions;
  }

  @override
  Future<User> getCurrentUser() async {
    await Future.delayed(Duration(milliseconds: 1000));
    return _currentUser!;
  }
}
