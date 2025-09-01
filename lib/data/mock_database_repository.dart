import '../common/classes/transaction.dart';
import 'database_repository.dart';
import '../common/classes/user.dart';

// TODO: Methoden anpassen und ausarbeiten
class MockDatabaseRepository implements DatabaseRepository {
  List<User> users = [
    User(
      username: "Nightmare2402",
      password: "@42Illuminati",
      email: "Marcusschmidt2402@Hotmail.de",
    ),
  ];

  late User currentUser;

  @override
  void initialize() {
    users[0].transactions.add(
      Transaction(
        title: "Miete",
        description: "Mietkosten",
        category: "Ausgabe",
        price: 800,
        transactionType: TransactionType.ausgabe,
        continuous: true,
        date: DateTime.now(),
        receipient: "Clara",
        sender: "Marcus",
      ),
    );
  }

  @override
  void createTransaction(Transaction transaction) {
    // TODO: implement createTransaction
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
    // TODO: implement readTransaction
    throw UnimplementedError();
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
  void setCurrentUser(User user) {
    currentUser = user;
  }
}
