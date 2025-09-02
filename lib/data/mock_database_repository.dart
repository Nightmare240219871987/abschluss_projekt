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
  void initialize(User user) {
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
  }

  @override
  void createTransaction(Transaction transaction) {
    _currentUser!.transactions.add(transaction);
  }

  @override
  void createUser(User user) {
    // TODO: implement createUser
  }

  @override
  void deleteTransaction(String id) {
    // TODO: implement deleteTransaction
  }

  @override
  void deleteUser(String id) {
    // TODO: implement deleteUser
  }

  @override
  Transaction readTransaction(String id) {
    return _currentUser!.transactions[int.parse(id)];
  }

  @override
  User? readUser(String username) {
    for (User u in users) {
      if (u.username == username) return u;
    }
    return null;
  }

  @override
  Transaction updateTransaction(String id, Transaction transaction) {
    // TODO: implement updateTransaction
    throw UnimplementedError();
  }

  @override
  User updateUser(String id, User user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  double getAvailable(int month) {
    return getSumOfIncoming(month) - getSumOfOutgoing(month);
  }

  @override
  double getSumOfIncoming(int month) {
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
  double getSumOfOutgoing(int month) {
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
  double getSumOfSaved(int month) {
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
  List<Transaction> getAllTransactions() {
    return _currentUser!.transactions;
  }
}
