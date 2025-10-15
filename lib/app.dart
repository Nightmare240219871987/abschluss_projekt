import 'package:abschluss_projekt/data/auth_repository.dart';
import 'package:abschluss_projekt/data/firebase_auth_repository.dart';
import 'package:abschluss_projekt/data/shared_prefs.dart';
import 'package:abschluss_projekt/features/add_transaction/presentation/add_transaction.dart';
import 'package:abschluss_projekt/features/archivements/presentation/archivements.dart';
import 'package:abschluss_projekt/features/login_screen/presentation/login_screen.dart';
import 'package:abschluss_projekt/features/login_screen/presentation/register_screen.dart';
import 'package:abschluss_projekt/features/settings/presentation/settings.dart';
import 'package:abschluss_projekt/features/statistics/presentation/statistics_dashboard.dart';
import 'package:abschluss_projekt/features/dashboard/presentation/dashboard.dart';
import 'package:abschluss_projekt/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    AuthRepository auth = context.read<FirebaseAuthRepository>();
    final themeProvider = Provider.of<ThemeProvider>(context);
    if (themeProvider.isDarkMode != loadDarkmode()) {
      themeProvider.setDarkTheme(loadDarkmode());
    }
    return StreamBuilder(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        return MaterialApp(
          key: Key(snapshot.data?.uid ?? "no user"),
          debugShowCheckedModeBanner: false,
          theme: themeProvider.themeData,
          routes: {
            "/dashboard": (context) => Dashboard(),
            "/addPage": (context) => AddTransaction(),
            "/statistics": (context) => StatisticsDashboard(),
            "/archivements": (context) => Archivements(),
            "/settings": (context) => Settings(),
            "/login": (context) => LoginScreen(),
            "/register": (context) => RegisterScreen(),
          },
          initialRoute: snapshot.hasData ? "/dashboard" : "/login",
        );
      },
    );
  }
}
