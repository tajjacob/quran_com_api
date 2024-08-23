import 'package:flutter/material.dart';
import 'package:quran_com_api/quran_com_api.dart';

class ChapterSinglePage extends StatefulWidget {
  const ChapterSinglePage({super.key});

  @override
  State<ChapterSinglePage> createState() => _ChapterSinglePageState();
}

class _ChapterSinglePageState extends State<ChapterSinglePage> {
  Chapter? chapter;

  Future<Chapter?> getChapter() async {
    chapter = await ChapterRepoInterface().getChapter(chapter: 114);
    return chapter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Chapter Single Page'),
      ),
      body: FutureBuilder<Chapter?>(
        future: getChapter(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Name: ${chapter?.nameSimple}'),
                  Text('Arabic: ${chapter?.nameArabic}'),
                  Text('Id: ${chapter?.id}'),
                  Text('Ayah Count: ${chapter?.versesCount}'),
                  Text('Revelation Order: ${chapter?.revelationOrder}'),
                  Text('Revelation Place: ${chapter?.revelationPlace}'),
                  Text('Bismillah Pre: ${chapter?.bismillahPre}'),
                  Text('Translated name: ${chapter?.translatedName?.name}'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
