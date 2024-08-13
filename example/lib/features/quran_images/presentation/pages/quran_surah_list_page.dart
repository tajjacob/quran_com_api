import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quran_com_api/quran_com_api.dart';

class QuranSurahListPage extends StatefulWidget {
  const QuranSurahListPage({super.key});

  @override
  State<QuranSurahListPage> createState() => _QuranSurahListPageState();
}

class _QuranSurahListPageState extends State<QuranSurahListPage> {
  Future<List<QuranSurah>> getQuranSurahList() async {
    List<QuranSurah> quranSurahList = [];
    quranSurahList = await QuranSurahRepoInterface().getQuranSurahListLocal();
    return quranSurahList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Quran Surah List Page'),
      ),
      body: FutureBuilder(
        future: getQuranSurahList(),
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
                    title: Text('Surah: ${snapshot.data![index].tname}'),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Surah Number: ${snapshot.data?[index].index}'),
                        Text('Surah Name: ${snapshot.data?[index].name}'),
                        Text(
                            'Surah English Name: ${snapshot.data?[index].ename}'),
                        Text('Surah Type: ${snapshot.data?[index].type}'),
                        Text('Surah Ayahs: ${snapshot.data?[index].ayas}'),
                        Text(
                            'Surah Revelation Order: ${snapshot.data?[index].order}'),
                      ],
                    ),
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const SizedBox(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
