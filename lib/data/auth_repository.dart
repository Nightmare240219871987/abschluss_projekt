import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<void> signInWithEmailAndPassword(
    String email,
    String password, {
    void Function(Object e)? onError,
  });
  Future<void> signOut();
  Future<void> createAccountWithEmailAndPassword(
    String email,
    String password, {
    void Function(Object e)? onError,
  });
  Future<void> deleteAccount();
  Stream<User?> authStateChanges();
}
