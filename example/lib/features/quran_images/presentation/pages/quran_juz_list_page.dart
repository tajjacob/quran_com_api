import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_com_api/quran_com_api.dart';

class QuranJuzListPage extends StatefulWidget {
  const QuranJuzListPage({super.key});

  @override
  State<QuranJuzListPage> createState() => _QuranJuzListPageState();
}

class _QuranJuzListPageState extends State<QuranJuzListPage> {
  Future<List<QuranJuz>> getQuranJuzList() async {
    List<QuranJuz> quranJuzList = [];
    quranJuzList = await QuranJuzRepoInterface().getQuranJuzListLocal();
    return quranJuzList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Quran Juz List Page'),
      ),
      body: FutureBuilder(
        future: getQuranJuzList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                },
              ),
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Juz: ${snapshot.data![index].juz}'),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: snapshot.data![index].hizb.map((e) {
                        return ListTile(
                          title: Text('Hizb: ${e.hizbIndex}'),
                          subtitle: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: e.rubList.map(
                              (r) {
                                return ListTile(
                                  title: Text(
                                    'Surah: ${r.suraDetail.tname}',
                                  ),
                                  subtitle: Text(
                                    r.firstWord,
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return SizedBox(
              height: 500,
              width: 1.sw,
              child: const CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}
