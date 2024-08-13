import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:quran_com_api/src/features/quran_images/data/models/quran_juz_model.dart';

abstract class QuranJuzRepoInterface {
  factory QuranJuzRepoInterface() => QuranJuzRepo();
  Future<List<QuranJuz>> getQuranJuzListLocal();
}

class QuranJuzRepo implements QuranJuzRepoInterface {
  final String quranJuzListJson =
      'packages/quran_com_api/assets/json/quran_juz_list.json';

  @override
  Future<List<QuranJuz>> getQuranJuzListLocal() async {
    List<QuranJuz>? quranJuzList;
    try {
      final json = await rootBundle.loadString(quranJuzListJson);
      quranJuzList =
          (jsonDecode(json) as List).map((e) => QuranJuz.fromJson(e)).toList();
    } catch (e) {
      log('json error: $e');
    }
    return quranJuzList!;
  }
}
