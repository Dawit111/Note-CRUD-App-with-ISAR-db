import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isar_crud_app/components/my_drawer.dart';
import 'package:isar_crud_app/components/note_tile.dart';
import 'package:isar_crud_app/models/note.dart';
import 'package:isar_crud_app/models/note_database.dart';
import 'package:provider/provider.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
// text controller
  final textController = TextEditingController();

  @override
  void initState() {
    // on app start up fetch the existing notess
    readNotes();
    // TODO: implement initState
    super.initState();
  }

  // create a note
  void createNote() {
    textController.clear();
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Theme.of(context).colorScheme.primary,
              content: TextField(
                controller: textController,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
                cursorColor: Theme.of(context).colorScheme.inversePrimary,
                decoration: InputDecoration(
                  hintText: 'Type new note here..',
                  hintStyle:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
              ),
              actions: [
                MaterialButton(
                    child: Text(
                      'create',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    onPressed: () {
                      // add to db
                      context.read<NoteDatabase>().addNote(textController.text);

                      // clear the controller
                      textController.clear();

                      // pop the dialoge box
                      Navigator.pop(context);
                    })
              ],
            ));
  }

  // read notes
  void readNotes() {
    context.read<NoteDatabase>().fetchNotes();
  }

  // update a note
  void updateNote(Note note) {
    // pre-fill the current note text
    textController.text = note.text;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
                backgroundColor: Theme.of(context).colorScheme.primary,
                title: Text(
                  'Update note',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                content: TextField(
                  controller: textController,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                  cursorColor: Theme.of(context).colorScheme.inversePrimary,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
                actions: [
                  MaterialButton(
                      textColor: Theme.of(context).colorScheme.inversePrimary,
                      child: const Text('Update'),
                      onPressed: () {
                        // update note in db
                        context
                            .read<NoteDatabase>()
                            .updateNote(note.id, textController.text);

                        // clear the controller
                        textController.clear();

                        // pop the dialoge box
                        Navigator.pop(context);
                      })
                ]));
  }

  // delete a note
  void deleteNote(int id) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Theme.of(context).colorScheme.surface,
              content: Text(
                "Sure to delete ?",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              actions: [
                MaterialButton(
                  textColor: Theme.of(context).colorScheme.inversePrimary,
                  onPressed: () {
                    context.read<NoteDatabase>().deleteNote(id);
                    Navigator.pop(context);
                  },
                  child: const Text('Yes'),
                ),
                MaterialButton(
                  textColor: Theme.of(context).colorScheme.inversePrimary,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    // note database instance
    final noteDatabase = context.watch<NoteDatabase>();

    // current notes
    List<Note> currentNotes = noteDatabase.currentNotes;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => createNote(),
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      drawer: const MyDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADING
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text('Notes',
                style: GoogleFonts.dmSerifText(
                    fontSize: 48,
                    color: Theme.of(context).colorScheme.inversePrimary)),
          ),

          // LIST OF NOTES
          Expanded(
            child: ListView.builder(
                itemCount: currentNotes.length,
                itemBuilder: (context, index) {
                  // get the individual notes
                  final currentNote = currentNotes[index];
                  // return the list tile UI
                  return NoteTile(
                    text: currentNote.text,
                    onEditPressed: () => updateNote(currentNote),
                    onDeletePressed: () => deleteNote(currentNote.id),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
