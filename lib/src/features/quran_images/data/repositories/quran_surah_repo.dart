import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:quran_com_api/src/features/quran_images/data/models/quran_surah_model.dart';

abstract class QuranSurahRepoInterface {
  factory QuranSurahRepoInterface() => QuranSurahRepo();
  Future<List<QuranSurah>> getQuranSurahListLocal();
}

class QuranSurahRepo implements QuranSurahRepoInterface {
  final String quranJuzListJson =
      'packages/quran_com_api/assets/json/quran_surah_list.json';

  @override
  Future<List<QuranSurah>> getQuranSurahListLocal() async {
    List<QuranSurah>? quranSurahList;
    try {
      final json = await rootBundle.loadString(quranJuzListJson);
      quranSurahList = (jsonDecode(json) as List)
          .map((e) => QuranSurah.fromJson(e))
          .toList();
    } catch (e) {
      log('json error: $e');
    }
    return quranSurahList!;
  }
}
