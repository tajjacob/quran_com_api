import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_com_api/quran_com_api.dart';

class ChapterListPage extends StatefulWidget {
  const ChapterListPage({super.key});

  @override
  State<ChapterListPage> createState() => _ChapterListPageState();
}

class _ChapterListPageState extends State<ChapterListPage> {
  List<Chapter>? chapterList;
  Future<List<Chapter>?> getChapterList() async {
    chapterList = await ChapterRepoInterface().getChapterList();
    return chapterList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Chapter List Page'),
      ),
      body: FutureBuilder<List<Chapter>?>(
        future: getChapterList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: 1.sh,
              width: 1.sw,
              child: const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return ListView.builder(
              itemCount: chapterList?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Name: ${chapterList?[index].nameSimple}'),
                  subtitle: Text('Arabic: ${chapterList?[index].nameArabic}'),
                  leading: Text('Id: ${chapterList?[index].id}'),
                  trailing:
                      Text('Ayah Count: ${chapterList?[index].versesCount}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
