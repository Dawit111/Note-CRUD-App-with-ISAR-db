import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final Widget leading;
  final void Function()? onTap;

  const DrawerTile(
      {super.key,
      required this.title,
      required this.leading,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ListTile(
        iconColor: theme.inversePrimary,
        textColor: theme.inversePrimary,
        title: Text(title),
        leading: leading,
        onTap: onTap,
      ),
    );
  }
}
