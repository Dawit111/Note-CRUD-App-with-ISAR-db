import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isar_crud_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: theme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: theme.inversePrimary,
      ),
      body: Container(
        decoration: BoxDecoration(
            color: theme.primary, borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        margin: const EdgeInsets.only(left: 25, right: 25, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // dark mode text
            Text(
              "Dark Mode",
              style: TextStyle(
                  color: theme.inversePrimary, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 10,
            ),

            // switch toggle
            CupertinoSwitch(
                value: Provider.of<ThemeProvider>(
                  context,
                  listen: false,
                ).isDarkMode,
                onChanged: (value) =>
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme())
          ],
        ),
      ),
    );
  }
}
