import 'user.dart';
import 'transaction.dart';

abstract class DatabaseRepository {
  // CREATE
  void createUser(User user);
  void createTransaction(Transaction transaction, User user);

  // READ
  User readUser(String id);
  Transaction readTransaction(String id);

  // UPDATE
  User updateUser(String id, User user);
  Transaction updateTransaction(String id, Transaction transaction);

  // DELETE
  void deleteUser(String id);
  void deleteTransaction(String id);
}
