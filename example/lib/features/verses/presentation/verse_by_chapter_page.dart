import 'package:flutter/material.dart';
import 'package:quran_com_api/quran_com_api.dart';

class VerseByChapterPage extends StatefulWidget {
  const VerseByChapterPage({super.key});

  @override
  State<VerseByChapterPage> createState() => _VerseByChapterPageState();
}

class _VerseByChapterPageState extends State<VerseByChapterPage> {
  VerseRepoInterface chapterRepo = VerseRepoInterface();

  Future<Verses?> getVerseByChapter() async {
    Verses? verses = await chapterRepo.getVerseByChapter(
      chapter: 1,
      params: VerseByChapterParam(
        words: true,
        // page: 2,
      ),
    );
    return verses;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: buildFutureBuilder()),
    );
  }

  FutureBuilder<dynamic> buildFutureBuilder() {
    return FutureBuilder<Verses?>(
      future: getVerseByChapter(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          Verses? verses = snapshot.data;
          return ListView.builder(
            itemCount: verses?.verses?.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(verses?.verses?[index].verseKey ?? 'N/A'),
                subtitle: Wrap(
                  children: verses?.verses?[index].words
                          ?.map((e) => Text('${e.translation?.text} '))
                          .toList() ??
                      [],
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return const Text('No Data');
        }
      },
    );
  }
}
