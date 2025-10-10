import 'package:abschluss_projekt/common/classes/transaction.dart';

class TranactionTypeUtils {
  static List<String> items = ["Ausgaben", "Einnahmen", "Erspartes"];
  static TransactionType deserializeTransactionType(String typeText) {
    TransactionType type;
    if (typeText == items[0]) {
      type = TransactionType.outgoing;
    } else if (typeText == items[1]) {
      type = TransactionType.incoming;
    } else if (typeText == items[2]) {
      type = TransactionType.saving;
    } else {
      type = TransactionType.outgoing;
    }
    return type;
  }

  static String serializeTransactionType(TransactionType type) {
    switch (type) {
      case TransactionType.outgoing:
        return items[0];
      case TransactionType.incoming:
        return items[1];
      case TransactionType.saving:
        return items[2];
    }
  }
}
