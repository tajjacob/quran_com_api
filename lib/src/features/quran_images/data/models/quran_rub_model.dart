import 'quran_sura_detail_model.dart';

class QuranRub {
  final int indexRub;
  final int indexHizb;
  final String rub;
  final String sura;
  final String page;
  final QuranSuraDetail suraDetail;
  final String aya;
  final String text;
  final String simple;
  final String firstWord;
  final String firstWordSimple;

  QuranRub({
    required this.indexRub,
    required this.indexHizb,
    required this.rub,
    required this.sura,
    required this.page,
    required this.suraDetail,
    required this.aya,
    required this.text,
    required this.simple,
    required this.firstWord,
    required this.firstWordSimple,
  });

  factory QuranRub.fromJson(Map<String, dynamic> json) {
    return QuranRub(
      indexRub: json['index_rub'],
      indexHizb: json['index_hizb'],
      rub: json['rub'],
      sura: json['sura'],
      page: json['page'],
      suraDetail: QuranSuraDetail.fromJson(json['sura_detail']),
      aya: json['aya'],
      text: json['text'],
      simple: json['simple'],
      firstWord: json['first_word'],
      firstWordSimple: json['first_word_simple'],
    );
  }
}
