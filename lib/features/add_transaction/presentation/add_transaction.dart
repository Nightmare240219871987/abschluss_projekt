import 'package:abschluss_projekt/common/classes/transaction.dart';
import 'package:abschluss_projekt/common/widgets/my_app_bar.dart';
import 'package:abschluss_projekt/common/widgets/colorized_icon_button.dart';
import 'package:abschluss_projekt/common/widgets/my_navigation_bar.dart';
import 'package:abschluss_projekt/data/database_repository.dart';
import 'package:abschluss_projekt/themes/theme_provider.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddTransaction extends StatefulWidget {
  final DatabaseRepository db;
  final ThemeProvider themeProvider;

  const AddTransaction({
    super.key,
    required this.themeProvider,
    required this.db,
  });

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final TextEditingController _titleCtrl = TextEditingController();
  final TextEditingController _descriptionCtrl = TextEditingController();
  final TextEditingController _amountCtrl = TextEditingController();
  final TextEditingController _senderCtrl = TextEditingController();
  final TextEditingController _receipientCtrl = TextEditingController();
  int _index = 20;

  List<String> items = ["Ausgaben", "Einnahmen", "Erspartes"];
  bool isContinue = false;
  DateTime? creationTime;

  late String currentChoice;

  @override
  void initState() {
    super.initState();
    currentChoice = items[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
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

                  ColorizedIconButton(
                    icon: Icon(Icons.qr_code_2_outlined),
                    onPressed: () {},
                  ),
                ],
              ),
              TextField(
                controller: _titleCtrl,
                decoration: InputDecoration(
                  labelText: "Titel",
                  labelStyle: TextStyle(
                    color: widget.themeProvider.isDarkMode
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
                    color: widget.themeProvider.isDarkMode
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
                    color: widget.themeProvider.isDarkMode
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
                    color: widget.themeProvider.isDarkMode
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
                    color: widget.themeProvider.isDarkMode
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
          TransactionType type;
          if (currentChoice == "Ausgaben") {
            type = TransactionType.outgoing;
          } else if (currentChoice == "Einnahmen") {
            type = TransactionType.incoming;
          } else if (currentChoice == "Erspartes") {
            type = TransactionType.saving;
          } else {
            type = TransactionType.outgoing;
          }
          // TODO: Index unique generieren
          await widget.db.createTransaction(
            Transaction(
              id: _index.toString(),
              title: _titleCtrl.text,
              description: _descriptionCtrl.text,
              price: double.tryParse(_amountCtrl.text) ?? 0,
              transactionType: type,
              continuous: isContinue,
              date: creationTime!,
              receipient: _receipientCtrl.text,
              sender: _senderCtrl.text,
            ),
          );
          _index++;
          if (context.mounted) {
            Navigator.of(context).pop();
          }
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: MyNavigationBar(),
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
