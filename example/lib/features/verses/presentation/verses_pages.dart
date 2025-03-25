import 'package:flutter/material.dart';

import 'verse_by_chapter_page.dart';

class VersesPages extends StatelessWidget {
  const VersesPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verses Pages'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VerseByChapterPage(),
                  ),
                );
              },
              child: const Text('Go to Verse By Chapter Page'),
            ),
          ],
        ),
      ),
    );
  }
}
