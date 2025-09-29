import 'package:abschluss_projekt/common/classes/transaction.dart';
import 'package:abschluss_projekt/common/classes/user.dart';
import 'package:abschluss_projekt/data/database_repository.dart';

class Firestorerepository implements DatabaseRepository {
  @override
  Future<void> createTransaction(Transaction transaction) {
    // TODO: implement createTransaction
    throw UnimplementedError();
  }

  @override
  Future<void> createUser(User user) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTransaction(String id) {
    // TODO: implement deleteTransaction
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUser(String id) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<List<Transaction>> getAllTransactions() {
    // TODO: implement getAllTransactions
    throw UnimplementedError();
  }

  @override
  Future<double> getAvailable(int month) {
    // TODO: implement getAvailable
    throw UnimplementedError();
  }

  @override
  Future<User> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<double> getSumOfIncoming(int month) {
    // TODO: implement getSumOfIncoming
    throw UnimplementedError();
  }

  @override
  Future<double> getSumOfOutgoing(int month) {
    // TODO: implement getSumOfOutgoing
    throw UnimplementedError();
  }

  @override
  Future<double> getSumOfSaved(int month) {
    // TODO: implement getSumOfSaved
    throw UnimplementedError();
  }

  @override
  Future<void> initialize(User user) {
    // TODO: implement initialize
    throw UnimplementedError();
  }

  @override
  Future<Transaction> readTransaction(String id) {
    // TODO: implement readTransaction
    throw UnimplementedError();
  }

  @override
  Future<User?> readUser(String username) {
    // TODO: implement readUser
    throw UnimplementedError();
  }

  @override
  Future<void> updateTransaction(String id, Transaction transaction) {
    // TODO: implement updateTransaction
    throw UnimplementedError();
  }

  @override
  Future<User> updateUser(String id, User user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
