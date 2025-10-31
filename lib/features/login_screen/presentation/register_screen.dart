import 'package:abschluss_projekt/data/auth_repository.dart';
import 'package:abschluss_projekt/data/firebase_auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  final TextEditingController _passwordConfirmCtrl = TextEditingController();
  bool isCorrect = false;

  @override
  void dispose() {
    _usernameCtrl.dispose();
    _passwordCtrl.dispose();
    _passwordConfirmCtrl.dispose();
    super.dispose();
  }

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
                        "Registrierung",
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
                              controller: _usernameCtrl,
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
                              controller: _passwordCtrl,
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
                                if (_passwordCtrl.text ==
                                    _passwordConfirmCtrl.text) {
                                  setState(() {
                                    isCorrect = true;
                                  });
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              onChanged: (value) =>
                                  _formKey.currentState!.validate(),
                              controller: _passwordConfirmCtrl,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Password Wiederholung",
                                hintText:
                                    "Geben Sie hier Ihr Passwort erneut ein.",
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
                                if (_passwordCtrl.text ==
                                    _passwordConfirmCtrl.text) {
                                  setState(() {
                                    isCorrect = true;
                                  });
                                }

                                return null;
                              },
                            ),
                          ],
                        ),
                      ),

                      ElevatedButton(
                        onPressed: isCorrect
                            ? () {
                                if (context.mounted) {
                                  auth.createAccountWithEmailAndPassword(
                                    _usernameCtrl.text,
                                    _passwordCtrl.text,
                                    onError: (Object e) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: const Text(
                                            "Registrierung fehlgeschlagen",
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
                          child: Text(
                            "Registrierung abschließen",
                            textAlign: TextAlign.center,
                          ),
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
