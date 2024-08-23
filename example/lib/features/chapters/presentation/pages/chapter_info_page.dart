import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:quran_com_api/quran_com_api.dart';

class ChapterInfoPage extends StatefulWidget {
  const ChapterInfoPage({super.key});

  @override
  State<ChapterInfoPage> createState() => _ChapterInfoPageState();
}

class _ChapterInfoPageState extends State<ChapterInfoPage> {
  ChapterInfo? chapter;

  Future<ChapterInfo?> getChapter() async {
    chapter = await ChapterRepoInterface()
        .getChapterInfo(chapter: 114, language: 'my');
    return chapter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Chapter Info Page'),
      ),
      body: FutureBuilder<ChapterInfo?>(
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
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('language name: ${chapter?.languageName}'),
                      SizedBox(height: 20.h),
                      Text('short text: ${chapter?.shortText}'),
                      SizedBox(height: 20.h),
                      Text('source: ${chapter?.source}'),
                      SizedBox(height: 20.h),
                      HtmlWidget(chapter?.text ?? 'Not Available'),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
