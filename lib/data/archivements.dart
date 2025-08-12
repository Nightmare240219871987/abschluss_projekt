class Archivements {
  // Singleton Variablen
  static Archivements? _archivements;

  // Singleton Methoden
  static Archivements getInstance() {
    if (_archivements == null) {
      return Archivements();
    } else {
      return _archivements!;
    }
  }

  // Konvertierung in JSON Format
  Map<String, dynamic> toJson() => {};
}
