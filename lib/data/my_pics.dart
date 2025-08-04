import "package:flutter/material.dart";

abstract class MyPics {
  static final Image available = Image.asset(
    "lib/common/assets/chart-up.png",
    height: 72,
  );
  static final Image incoming = Image.asset(
    "lib/common/assets/geld-bekommen.png",
    height: 72,
  );
  static final Image outgoing = Image.asset(
    "lib/common/assets/geldscheine-stapeln.png",
    height: 72,
  );
  static final Image save = Image.asset(
    "lib/common/assets/sparschwein.png",
    height: 72,
  );

  static final Image logo = Image.asset(
    "lib/common/assets/logo.png",
    height: 72,
  );
}
