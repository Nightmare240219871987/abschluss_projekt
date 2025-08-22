class Archivements {
  static Archivements? _archivements;

  static Archivements getInstance() {
    if (_archivements == null) {
      return Archivements();
    } else {
      return _archivements!;
    }
  }
}
