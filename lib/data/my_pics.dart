import "package:flutter/material.dart";

abstract class MyPics {
  static final Image available = Image.asset(
    "assets/chart-up.png",
    cacheHeight: 72,
  );
  static final Image incoming = Image.asset(
    "assets/geld-bekommen.png",
    cacheHeight: 72,
  );
  static final Image outgoing = Image.asset(
    "assets/geldscheine-stapeln.png",
    cacheHeight: 72,
  );
  static final Image save = Image.asset(
    "assets/sparschwein.png",
    cacheHeight: 72,
  );

  static final Image logo = Image.asset("assets/logo.png", cacheHeight: 72);
}
