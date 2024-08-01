import 'package:flutter/material.dart';
import 'package:quran_com_api/quran_com_api.dart';

class QuranImagePage extends StatefulWidget {
  const QuranImagePage({super.key});

  @override
  State<QuranImagePage> createState() => _QuranImagePageState();
}

class _QuranImagePageState extends State<QuranImagePage> {
  Future<List<QuranImage>> getQuranImages() async {
    List<QuranImage> quranImageList = [];
    quranImageList = await QuranImageRepoInterface().getQuranImagesLocal();
    return quranImageList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quran Image Page'),
      ),
      body: FutureBuilder(
        future: getQuranImages(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return PageView.builder(
              reverse: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        snapshot.data![index].quranImage!,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Text(
                      snapshot.data![index].quranPage!,
                    ),
                  ],
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
