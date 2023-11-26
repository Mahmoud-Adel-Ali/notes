import 'package:flutter/material.dart';

class NoteItemCard extends StatelessWidget {
  const NoteItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding:  const EdgeInsets.fromLTRB(16, 24, 0, 16),
      decoration: BoxDecoration(
        color: Colors.yellow.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: const Text(
              "Flutter tipce",
              style: TextStyle(fontSize: 26, color: Colors.black),
            ),
            subtitle:  Padding(
              padding:const EdgeInsets.only(top: 16),
              child: Text(
                "Build your carear with Mahmoud Adel",
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
            padding: EdgeInsets.only(right:24.0),
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
