import '../common/classes/user.dart';
import '../common/classes/transaction.dart';

abstract class DatabaseRepository {
  void setCurrentUser(User user);
  // CREATE
  void createUser(User user);
  void createTransaction(Transaction transaction);
  void initialize();
  // READ
  User? readUser(String username);
  Transaction readTransaction(String id);

  // UPDATE
  User updateUser(String id, User user);
  Transaction updateTransaction(String id, Transaction transaction);

  // DELETE
  void deleteUser(String id);
  void deleteTransaction(String id);
}
