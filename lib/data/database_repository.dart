import '../common/classes/user.dart';
import '../common/classes/transaction.dart';

abstract class DatabaseRepository {
  // Programm functionality
  double getSumOfOutgoing(int month);
  double getSumOfIncoming(int month);
  double getSumOfSaved(int month);
  double getAvailable(int month);
  List<Transaction> getAllTransactions();

  // CREATE
  void createUser(User user);
  void createTransaction(Transaction transaction);
  void initialize(User user);
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
