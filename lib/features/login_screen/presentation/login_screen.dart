import 'package:abschluss_projekt/data/auth_repository.dart';
import 'package:abschluss_projekt/data/firebase_auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isCorrect = false;
  // TODO: Registrierung hinzufügen
  @override
  Widget build(BuildContext context) {
    AuthRepository auth = context.read<FirebaseAuthRepository>();
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    spacing: 8,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          spacing: 8,
                          children: [
                            TextFormField(
                              onChanged: (value) =>
                                  _formKey.currentState!.validate(),
                              controller: _usernameController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Username",
                                hintText: "Geben sie den Benutzernamen ein.",
                              ),
                              validator: (value) {
                                if (value != null && value.isEmpty) {
                                  return "Dieses Feld darf nicht leer sein.";
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              onChanged: (value) =>
                                  _formKey.currentState!.validate(),
                              controller: _passwordController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Password",
                                hintText: "Geben Sie hier Ihr Passwort ein.",
                              ),
                              obscureText: true,
                              validator: (value) {
                                isCorrect = false;
                                RegExp reExtra = RegExp(r"[!@#$%^&*()]");
                                RegExp reUpperCase = RegExp(r"[A-Z]");
                                RegExp reLowerCase = RegExp(r"[a-z]");
                                RegExp reDigits = RegExp(r"\d");
                                if (value == null) {
                                  return "das Password darf nicht leer sein.";
                                } else {
                                  if (value.length <= 7) {
                                    return "Das Passwort muss mindestens 8 zeichen haben.";
                                  }
                                  if (!reExtra.hasMatch(value)) {
                                    return "Das Passwort muss Sonderzeichen enthalten";
                                  }
                                  if (!reUpperCase.hasMatch(value)) {
                                    return "Das Passwort muss große Buchstaben enthalten.";
                                  }
                                  if (!reLowerCase.hasMatch(value)) {
                                    return "Das Passwort muss kleine Buchstaben enthalten.";
                                  }
                                  if (!reDigits.hasMatch(value)) {
                                    return "Das Passwort muss Zahlen enthalten.";
                                  }
                                }
                                setState(() {
                                  isCorrect = true;
                                });
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),

                      ElevatedButton(
                        onPressed: isCorrect
                            ? () async {
                                if (context.mounted) {
                                  await auth.signInWithEmailAndPassword(
                                    _usernameController.text,
                                    _passwordController.text,
                                    onError: (Object e) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: const Text(
                                            "Login fehlgeschlagen.",
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
                              }
                            : null,
                        child: SizedBox(
                          width: double.infinity,
                          child: Text("Login", textAlign: TextAlign.center),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
