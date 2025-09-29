import 'package:abschluss_projekt/data/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepository implements AuthRepository {
  @override
  Stream<User?> authStateChanges() {
    return FirebaseAuth.instance.authStateChanges();
  }

  @override
  Future<void> createAccountWithEmailAndPassword(
    String email,
    String password, {
    void Function(Object e)? onError,
  }) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> deleteAccount() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseAuth.instance.currentUser!.delete();
    }
  }

  @override
  Future<void> signInWithEmailAndPassword(
    String email,
    String password, {
    void Function(Object e)? onError,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      if (onError != null) {
        onError(e);
      }
    }
  }

  @override
  Future<void> signOut() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      if (FirebaseAuth.instance.currentUser!.isAnonymous) {
        await FirebaseAuth.instance.currentUser!.delete();
      }
      await FirebaseAuth.instance.signOut();
    }
  }
}
