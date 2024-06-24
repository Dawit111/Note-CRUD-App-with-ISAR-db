import 'package:flutter/material.dart';
import 'package:isar_crud_app/components/drawer_tile.dart';
import 'package:isar_crud_app/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          // header
          DrawerHeader(
              child: Icon(
            Icons.edit,
            color: Theme.of(context).colorScheme.inversePrimary,
            size: 48,
          )),
          const SizedBox(
            height: 25,
          ),
          // notes tile
          DrawerTile(
              title: "Notes",
              leading: const Icon(
                Icons.home,
              ),
              onTap: () => Navigator.pop(context)),

          // settings tile
          DrawerTile(
              title: "Settings",
              leading: const Icon(
                Icons.settings,
              ),
              onTap: () {
                // pop drawer first
                Navigator.pop(context);
                // go to settings page
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              })
        ],
      ),
    );
  }
}
