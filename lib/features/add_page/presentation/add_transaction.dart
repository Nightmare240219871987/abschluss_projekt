import 'package:abschluss_projekt/data/widgets/appbar.dart';
import 'package:abschluss_projekt/features/add_page/domain/colorized_icon_button.dart';
import 'package:abschluss_projekt/themes/theme_provider.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddTransaction extends StatelessWidget {
  late BuildContext context;
  // ignore: prefer_typing_uninitialized_variables
  final ThemeProvider themeProvider;
  AddTransaction({super.key, required this.themeProvider});

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: MyAppBar(themeProvider: themeProvider),
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
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          if (value == 1) {
          } else if (value == 2) {
          } else if (value == 3) {
          } else {}
        },
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home, size: 38),
            label: "Startseite",
          ),
          NavigationDestination(
            icon: Icon(Icons.area_chart_outlined, size: 38),
            label: "Statistik",
          ),
          NavigationDestination(
            icon: Icon(Icons.check_circle_outlined, size: 38),
            label: "Erfolge",
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined, size: 38),
            label: "Einstellungen",
          ),
        ],
      ),
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
