import 'package:abschluss_projekt/common/widgets/my_app_bar.dart';
import 'package:abschluss_projekt/common/widgets/colorized_icon_button.dart';
import 'package:abschluss_projekt/common/widgets/my_navigation_bar.dart';
import 'package:abschluss_projekt/themes/theme_provider.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddTransaction extends StatelessWidget {
  late BuildContext context;
  final ThemeProvider themeProvider;
  AddTransaction({super.key, required this.themeProvider});

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 40,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 40,
              children: [
                ColorizedIconButton(
                  icon: Icon(Icons.input_outlined),
                  onPressed: () {},
                ),
                ColorizedIconButton(
                  icon: Icon(Icons.output_outlined),
                  onPressed: () {},
                ),
                ColorizedIconButton(
                  icon: Icon(Icons.euro_outlined),

                  onPressed: () {},
                ),
                ColorizedIconButton(
                  icon: Icon(Icons.qr_code_2_outlined),
                  onPressed: () {},
                ),
              ],
            ),
            TextField(
              decoration: InputDecoration(
                label: Text("Titel der Transaktion"),
                labelStyle: TextStyle(
                  color: themeProvider.isDarkMode
                      ? Color(0xFFeeeeee)
                      : Color(0xFF111111),
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                label: Text("Beschreibung der Transaktion"),
                labelStyle: TextStyle(
                  color: themeProvider.isDarkMode
                      ? Color(0xFFeeeeee)
                      : Color(0xFF111111),
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                label: Text("Betrag der Transaktion"),
                labelStyle: TextStyle(
                  color: themeProvider.isDarkMode
                      ? Color(0xFFeeeeee)
                      : Color(0xFF111111),
                ),
              ),
            ),

            Row(
              children: [
                Checkbox(value: false, onChanged: onContinuousOutput),
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
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(48),
        ),
        elevation: 8,
        onPressed: () {
          //Navigator.pushNamed(context, "/addPage");
        },

        child: Icon(Icons.add),
      ),
      bottomNavigationBar: MyNavigationBar(),
    );
  }

  void onContinuousOutput(bool? value) {}

  void onDatePressed() async {
    await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2999),
    );
  }
}
