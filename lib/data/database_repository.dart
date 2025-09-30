import '../common/classes/user.dart';
import '../common/classes/transaction.dart';

abstract class DatabaseRepository {
  // Programm functionality
  Future<double> getSumOfOutgoing(int month);
  Future<double> getSumOfIncoming(int month);
  Future<double> getSumOfSaved(int month);
  Future<double> getAvailable(int month);
  Future<List<Transaction>> getAllTransactions();

  // CREATE
  Future<void> createTransaction(Transaction transaction);
  Future<void> initialize(User user);

  // READ
  Future<Transaction> readTransaction(String id);
  Future<User> getCurrentUser();

  // UPDATE
  Future<void> updateTransaction(String id, Transaction transaction);

  // DELETE
  Future<void> deleteTransaction(String id);
}
