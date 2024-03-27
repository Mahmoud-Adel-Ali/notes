import 'package:flutter/material.dart';
import 'package:notes/model/note_model.dart';

class NoteItemCard extends StatefulWidget {
  const NoteItemCard({super.key, required this.note});
  final NoteModel note;
  @override
  State<NoteItemCard> createState() => _NoteItemCardState();
}

class _NoteItemCardState extends State<NoteItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.fromLTRB(16, 24, 0, 16),
      decoration: BoxDecoration(
        color: Colors.yellow.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title:  Text(
              widget.note.title,
              style: TextStyle(fontSize: 26, color: Colors.black),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                widget.note.subTitle,
                style: TextStyle(
                    fontSize: 18, color: Colors.black.withOpacity(0.5)),
              ),
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                  size: 25,
                )),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 24.0),
            child: Text(
              "may 21 2022",
              style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(195, 52, 25, 0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
