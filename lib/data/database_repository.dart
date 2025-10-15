import '../common/classes/user.dart';
import '../common/classes/transaction.dart';

abstract class DatabaseRepository {
  // Programm functionality
  double getSumOfOutgoing(int month);
  double getSumOfIncoming(int month);
  double getSumOfSaved(int month);
  double getAvailable(int month);
  Future<List<Transaction>> getAllTransactions();
  void setUser(User user);
  User getUser();

  // CREATE
  Future<void> createTransaction(Transaction transaction);
  Future<void> initialize();

  // READ
  Future<Transaction?> readTransaction(String id);

  // UPDATE
  Future<void> updateTransaction(String id, Transaction transaction);

  // DELETE
  Future<void> deleteTransaction(String id);
  Future<void> deleteUser();
}
