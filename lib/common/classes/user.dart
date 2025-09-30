import 'archivements.dart';
import 'transaction.dart';

class User {
  String email;
  Archivements archivements = Archivements();
  double currentSaved;
  double currentThreshholdNextMedal;
  List<Transaction> transactions = [];

  User({
    required this.email,
    this.currentSaved = 0,
    this.currentThreshholdNextMedal = 0,
  });
}
