import "package:flutter/material.dart";

abstract class MyPics {
  static final Image available = Image.asset(
    "lib/assets/chart-up.png",
    height: 72,
  );
  static final Image incoming = Image.asset(
    "lib/assets/geld-bekommen.png",
    height: 72,
  );
  static final Image outgoing = Image.asset(
    "lib/assets/geldscheine-stapeln.png",
    height: 72,
  );
  static final Image save = Image.asset(
    "lib/assets/sparschwein.png",
    height: 72,
  );

  static final Image logo = Image.asset("lib/assets/logo.png", height: 72);
}
