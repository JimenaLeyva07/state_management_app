import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.playlist_add_check_sharp,
              ),
              label: const Text('Set user'),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.edit_sharp),
              label: const Text('Modify age'),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Add profession'),
            )
          ],
        ),
      ),
    );
  }
}
