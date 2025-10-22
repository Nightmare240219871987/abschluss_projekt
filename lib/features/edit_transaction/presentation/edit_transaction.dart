import 'package:abschluss_projekt/common/classes/transaction.dart';
import 'package:abschluss_projekt/data/database_repository.dart';
import 'package:abschluss_projekt/data/firestore_repository.dart';
import 'package:abschluss_projekt/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:abschluss_projekt/features/edit_transaction/domain/tranaction_type_utils.dart';

// ignore: must_be_immutable
class EditTransaction extends StatefulWidget {
  String id;

  EditTransaction({super.key, required this.id});

  @override
  State<EditTransaction> createState() => _EditTransactionState();
}

class _EditTransactionState extends State<EditTransaction> {
  late DatabaseRepository db;
  late ThemeProvider themeProvider;
  final TextEditingController _titleCtrl = TextEditingController();
  final TextEditingController _descriptionCtrl = TextEditingController();
  final TextEditingController _amountCtrl = TextEditingController();
  final TextEditingController _senderCtrl = TextEditingController();
  final TextEditingController _receipientCtrl = TextEditingController();
  final List<String> items = ["Ausgaben", "Einnahmen", "Erspartes"];
  bool isContinue = false;
  DateTime? creationTime;

  String currentChoice = "Ausgaben";

  Future<void> _editState(String id) async {
    Transaction? t = await db.readTransaction(id);
    if (t != null) {
      _titleCtrl.text = t.title;
      _descriptionCtrl.text = t.description;
      _amountCtrl.text = t.price.toStringAsFixed(2);
      _senderCtrl.text = t.sender;
      _receipientCtrl.text = t.receipient;
      currentChoice = TranactionTypeUtils.serializeTransactionType(
        t.transactionType,
      );
      isContinue = t.continuous;
      creationTime = t.date;
      setState(() {});
    }
  }

  @override
  void initState() {
    db = context.read<FirestoreRepository>();
    themeProvider = context.read<ThemeProvider>();
    super.initState();
    _editState(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hinzufügen"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 40,
            children: [
              SizedBox(height: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Theme(
                    data: Theme.of(
                      context,
                    ).copyWith(canvasColor: Color(0xFF392FFF)),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF392FFF),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            value: currentChoice,
                            items: items
                                .map<DropdownMenuItem>(
                                  (String item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Center(
                                      child: Text(
                                        item,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                currentChoice = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              TextField(
                controller: _titleCtrl,
                decoration: InputDecoration(
                  labelText: "Titel",
                  labelStyle: TextStyle(
                    color: themeProvider.isDarkMode
                        ? Color(0xFFeeeeee)
                        : Color(0xFF111111),
                  ),
                  hintText: "Titel der Transaktion",
                ),
              ),
              TextField(
                controller: _descriptionCtrl,
                decoration: InputDecoration(
                  labelText: "Beschreibung",
                  labelStyle: TextStyle(
                    color: themeProvider.isDarkMode
                        ? Color(0xFFeeeeee)
                        : Color(0xFF111111),
                  ),
                  hintText: "Beschreibung der Transaktion",
                ),
              ),
              TextField(
                controller: _amountCtrl,
                decoration: InputDecoration(
                  labelText: "Betrag",
                  labelStyle: TextStyle(
                    color: themeProvider.isDarkMode
                        ? Color(0xFFeeeeee)
                        : Color(0xFF111111),
                  ),
                  hintText: "Betrag der Transaktion",
                ),
              ),
              TextField(
                controller: _senderCtrl,
                decoration: InputDecoration(
                  label: Text("Sender"),
                  labelStyle: TextStyle(
                    color: themeProvider.isDarkMode
                        ? Color(0xFFeeeeee)
                        : Color(0xFF111111),
                  ),
                ),
              ),
              TextField(
                controller: _receipientCtrl,
                decoration: InputDecoration(
                  label: Text("Empfänger"),
                  labelStyle: TextStyle(
                    color: themeProvider.isDarkMode
                        ? Color(0xFFeeeeee)
                        : Color(0xFF111111),
                  ),
                ),
              ),
              Row(
                children: [
                  Checkbox(value: isContinue, onChanged: onContinuousOutput),
                  Text("Regelmäßige Ausgaben", style: TextStyle(fontSize: 18)),
                ],
              ),
              ElevatedButton(
                onPressed: onDatePressed,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    spacing: 4,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.calendar_month_outlined, size: 24),
                      Text("Datum", style: TextStyle(fontSize: 24)),
                    ],
                  ),
                ),
              ),
              Text(creationTime != null ? creationTime.toString() : ""),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 8,
        onPressed: () async {
          TransactionType type = TranactionTypeUtils.deserializeTransactionType(
            currentChoice,
          );
          await db.updateTransaction(
            widget.id,
            Transaction(
              id: "",
              title: _titleCtrl.text,
              description: _descriptionCtrl.text,
              price: double.parse(_amountCtrl.text),
              transactionType: type,
              continuous: isContinue,
              date: creationTime!,
              receipient: _receipientCtrl.text,
              sender: _senderCtrl.text,
            ),
          );
          if (context.mounted) {
            Navigator.of(context).pop();
          }
        },
        child: Icon(Icons.edit),
      ),
    );
  }

  void onContinuousOutput(bool? value) {
    setState(() {
      isContinue = value!;
    });
  }

  void onDatePressed() async {
    creationTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(0),
      lastDate: DateTime(2999),
    );
    setState(() {});
  }
}
