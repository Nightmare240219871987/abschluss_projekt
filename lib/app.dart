import 'package:abschluss_projekt/data/auth_repository.dart';
import 'package:abschluss_projekt/data/firebase_auth_repository.dart';
import 'package:abschluss_projekt/data/shared_prefs.dart';
import 'package:abschluss_projekt/features/landing_page/landing_page.dart';
import 'package:abschluss_projekt/features/login_screen/presentation/login_screen.dart';
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
      WidgetsBinding.instance.addPostFrameCallback((duration) {
        themeProvider.setDarkTheme(loadDarkmode());
      });
    }
    return StreamBuilder(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        return MaterialApp(
          key: Key(snapshot.data?.uid ?? "no user"),
          scaffoldMessengerKey: GlobalKey<ScaffoldMessengerState>(),
          debugShowCheckedModeBanner: false,
          theme: themeProvider.themeData,
          home: snapshot.hasData ? LandingPage() : LoginScreen(),
        );
      },
    );
  }
}
