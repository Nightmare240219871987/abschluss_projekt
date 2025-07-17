import 'package:abschluss_projekt/Widgets/colorized_icon_button.dart';
import 'package:abschluss_projekt/Widgets/styled_text_field.dart';
import 'package:flutter/material.dart';
import 'package:abschluss_projekt/Classes/my_colors.dart';

// ignore: must_be_immutable
class AddPage extends StatelessWidget {
  late BuildContext context;
  AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64,
        title: Padding(
          padding: EdgeInsetsGeometry.all(8),
          child: Text("Finance Tracker"),
        ),
      ),
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
                  icon: Icon(Icons.input_outlined, color: MyColors.whiteSpace),
                  backgroundColor: MyColors.primary,
                  onPressed: () {},
                ),
                ColorizedIconButton(
                  icon: Icon(Icons.output_outlined, color: MyColors.whiteSpace),
                  backgroundColor: MyColors.primary,
                  onPressed: () {},
                ),
                ColorizedIconButton(
                  icon: Icon(Icons.euro_outlined, color: MyColors.whiteSpace),
                  backgroundColor: MyColors.primary,
                  onPressed: () {},
                ),
                ColorizedIconButton(
                  icon: Icon(
                    Icons.qr_code_2_outlined,
                    color: MyColors.whiteSpace,
                  ),
                  backgroundColor: MyColors.primary,
                  onPressed: () {},
                ),
              ],
            ),
            StyledTextField(
              label: "Title der Transaktion",
              borderColor: MyColors.primary,
            ),
            StyledTextField(
              label: "Betrag der Transaktion",
              borderColor: MyColors.primary,
            ),
            StyledTextField(
              label: "Beschreibung der Transaktion",
              borderColor: MyColors.primary,
            ),
            SizedBox(height: 100),
            Row(
              children: [
                Checkbox(value: false, onChanged: onContinuousOutput),
                Text("Regelmäßige Ausgaben", style: TextStyle(fontSize: 18)),
              ],
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(MyColors.primary),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(8),
                  ),
                ),
              ),
              onPressed: onDatePressed,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  spacing: 4,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      color: MyColors.whiteSpace,
                      size: 24,
                    ),
                    Text(
                      "Datum",
                      style: TextStyle(
                        color: MyColors.whiteSpace,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.large(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(48),
        ),
        elevation: 8,
        backgroundColor: MyColors.primary,
        onPressed: () {
          //Navigator.pushNamed(context, "/addPage");
        },

        child: Icon(Icons.add, color: MyColors.whiteSpace),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: MyColors.notBody,
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
