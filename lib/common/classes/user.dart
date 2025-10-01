import 'archivements.dart';
import 'transaction.dart';

class User {
  String email;
  String uid;
  Archivements archivements = Archivements();
  double currentSaved;
  double currentThreshholdNextMedal;
  List<Transaction> transactions = [];

  User({
    required this.email,
    required this.uid,
    this.currentSaved = 0,
    this.currentThreshholdNextMedal = 0,
  });
}
