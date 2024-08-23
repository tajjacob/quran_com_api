import 'package:flutter/material.dart';

import 'quran_image_page.dart';
import 'quran_juz_list_page.dart';
import 'quran_surah_list_page.dart';

class QuranImagesListPage extends StatelessWidget {
  const QuranImagesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Quran Images List Page'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuranImagePage(),
                    ),
                  );
                },
                child: const Text('Go to Quran Image Page'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuranJuzListPage(),
                    ),
                  );
                },
                child: const Text('Go to Quran Juz List'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuranSurahListPage(),
                    ),
                  );
                },
                child: const Text('Go to Quran Surah List'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
