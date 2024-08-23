import 'chapter_translated_name_model.dart';

class Chapter {
  Chapter({
    this.id,
    this.revelationPlace,
    this.revelationOrder,
    this.bismillahPre,
    this.nameSimple,
    this.nameComplex,
    this.nameArabic,
    this.versesCount,
    this.pages,
    this.translatedName,
  });

  final int? id;
  final String? revelationPlace;
  final int? revelationOrder;
  final bool? bismillahPre;
  final String? nameSimple;
  final String? nameComplex;
  final String? nameArabic;
  final int? versesCount;
  final List<int>? pages;
  final ChapterTranslatedName? translatedName;

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
        id: json['id'] as int?,
        revelationPlace: json['revelation_place'] as String?,
        revelationOrder: json['revelation_order'] as int?,
        bismillahPre: json['bismillah_pre'] as bool?,
        nameSimple: json['name_simple'] as String?,
        nameComplex: json['name_complex'] as String?,
        nameArabic: json['name_arabic'] as String?,
        versesCount: json['verses_count'] as int?,
        pages: List<int>.from(json['pages'] as List<dynamic>),
        translatedName: ChapterTranslatedName.fromJson(
            json['translated_name'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'revelation_place': revelationPlace,
        'revelation_order': revelationOrder,
        'bismillah_pre': bismillahPre,
        'name_simple': nameSimple,
        'name_complex': nameComplex,
        'name_arabic': nameArabic,
        'verses_count': versesCount,
        'pages': pages,
        'translated_name': translatedName?.toJson(),
      };
}
