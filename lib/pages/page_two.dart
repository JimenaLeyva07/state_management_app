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
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Set user'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Modify age'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Add profession'),
            )
          ],
        ),
      ),
    );
  }
}
