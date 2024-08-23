import 'package:flutter/material.dart';

import 'features/audio/presentation/pages/audio_page.dart';
import 'features/chapters/presentation/pages/chapter_pages.dart';
import 'features/quran_images/presentation/pages/quran_images_list_page.dart';

class QuranComApiPage extends StatefulWidget {
  const QuranComApiPage({super.key, required this.title});

  final String title;

  @override
  State<QuranComApiPage> createState() => _QuranComApiPageState();
}

class _QuranComApiPageState extends State<QuranComApiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
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
                    builder: (context) => const AudioPage(),
                  ),
                );
              },
              child: const Text('Go to Audio Pages'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QuranImagesListPage(),
                  ),
                );
              },
              child: const Text('Go to Quran Image List Pages'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChapterPages(),
                  ),
                );
              },
              child: const Text('Go to Quran Chapter Pages'),
            ),
          ],
        ),
      ),
    );
  }
}
