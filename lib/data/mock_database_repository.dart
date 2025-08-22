import '../common/classes/transaction.dart';
import 'database_repository.dart';
import '../common/classes/user.dart';

// TODO: Methoden anpassen und ausarbeiten
// TODO: Datensatz hier drin halten
class MockDatabaseRepository implements DatabaseRepository {
  @override
  void createTransaction(Transaction transaction, User user) {
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
  User readUser(String id) {
    // TODO: implement readUser
    throw UnimplementedError();
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
}
