import 'package:flutter/material.dart';

class RouteDefinition {
  static void route(BuildContext context, int value) {
    if (value == 0) {
      Navigator.pushReplacementNamed(context, "/transactionDashboard");
    }
    if (value == 1) {
      Navigator.pushReplacementNamed(context, "/statisticsDashboard");
    } else if (value == 2) {
      Navigator.pushReplacementNamed(context, "/archivements");
    } else if (value == 3) {
      Navigator.pushReplacementNamed(context, "/settings");
    }
  }
}
