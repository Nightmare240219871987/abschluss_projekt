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
  Future<void> createUser(User user);
  Future<void> createTransaction(Transaction transaction);
  Future<void> initialize(User user);
  // READ
  Future<User?> readUser(String username);
  Future<Transaction> readTransaction(String id);
  Future<User> getCurrentUser();

  // UPDATE
  Future<User> updateUser(String id, User user);
  Future<Transaction> updateTransaction(String id, Transaction transaction);

  // DELETE
  Future<void> deleteUser(String id);
  Future<void> deleteTransaction(String id);
}
