import 'quran_rub_model.dart';

class QuranHizb {
  final String hizbIndex;
  final List<QuranRub> rubList;

  QuranHizb({
    required this.hizbIndex,
    required this.rubList,
  });

  factory QuranHizb.fromJson(Map<String, dynamic> json) {
    return QuranHizb(
      hizbIndex: json['hizbIndex'],
      rubList:
          (json['rubList'] as List).map((e) => QuranRub.fromJson(e)).toList(),
    );
  }
}
