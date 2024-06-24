import 'package:flutter/material.dart';

class NoteSettings extends StatelessWidget {
  final void Function()? onEditTap;
  final void Function()? onDeleteTap;
  const NoteSettings(
      {super.key, required this.onEditTap, required this.onDeleteTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Edit option
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            onEditTap!();
          },
          child: Container(
            height: 50,
            color: Theme.of(context).colorScheme.surface,
            child: Center(
                child: Text(
              'Edit',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary),
            )),
          ),
        ),

        // Delete option
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            onDeleteTap!();
          },
          child: Container(
            height: 50,
            color: Theme.of(context).colorScheme.surface,
            child: Center(
                child: Text(
              'Delete',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary),
            )),
          ),
        ),
      ],
    );
  }
}