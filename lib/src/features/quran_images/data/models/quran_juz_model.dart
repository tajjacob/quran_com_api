import 'package:quran_com_api/src/features/quran_images/data/models/quran_hizb_model.dart';

class QuranJuz {
  final String juz;
  final List<QuranHizb> hizb;

  QuranJuz({
    required this.juz,
    required this.hizb,
  });

  factory QuranJuz.fromJson(Map<String, dynamic> json) {
    return QuranJuz(
      juz: json['juz'],
      hizb: (json['hizb'] as List).map((e) => QuranHizb.fromJson(e)).toList(),
    );
  }
}
