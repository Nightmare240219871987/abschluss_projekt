import '../common/classes/user.dart';
import '../common/classes/transaction.dart';

abstract class DatabaseRepository {
  // Programm functionality
  double getSumOfOutgoing(int month);
  double getSumOfIncoming(int month);
  double getSumOfSaved();
  double getAvailable(int month);
  Future<List<Transaction>> getAllTransactions();
  void setUser(User user);
  User getUser();

  // CREATE
  Future<void> createTransaction(Transaction transaction);
  Future<void> initialize();
  Future<void> createNewUser();

  // READ
  Future<Transaction?> readTransaction(String id);
  double readCurrentSaved();
  Future<bool> currentSavedExists();

  // UPDATE
  Future<void> updateTransaction(String id, Transaction transaction);
  Future<void> addCurrentSaved(double saved);

  // DELETE
  Future<void> deleteTransaction(String id);
  Future<void> deleteUser();
}
