import 'verse_tafsir_model.dart';
import 'verse_translation_model.dart';
import 'verse_word_model.dart';

class Verse {
  final int? id;
  final int? verseNumber;
  final int? pageNumber;
  final String? verseKey;
  final int? juzNumber;
  final int? hizbNumber;
  final int? rubElHizbNumber;
  final String? sajdahType;
  final int? sajdahNumber;
  final List<VerseWord>? words;
  final List<VerseTranslation>? translations;
  final List<VerseTafsir>? tafsirs;

  Verse({
    this.id,
    this.verseNumber,
    this.pageNumber,
    this.verseKey,
    this.juzNumber,
    this.hizbNumber,
    this.rubElHizbNumber,
    this.sajdahType,
    this.sajdahNumber,
    this.words,
    this.translations,
    this.tafsirs,
  });

  factory Verse.fromJson(Map<String, dynamic> json) => Verse(
        id: json['id'] as int?,
        verseNumber: json['verse_number'] as int?,
        pageNumber: json['page_number'] as int?,
        verseKey: json['verse_key'] as String?,
        juzNumber: json['juz_number'] as int?,
        hizbNumber: json['hizb_number'] as int?,
        rubElHizbNumber: json['rub_el_hizb_number'] as int?,
        sajdahType: json['sajdah_type'] as String?,
        sajdahNumber: json['sajdah_number'] as int?,
        words: (json['words'] as List<dynamic>?)
                ?.map((e) => VerseWord.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
        translations: (json['translations'] as List<dynamic>?)
                ?.map(
                    (e) => VerseTranslation.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
        tafsirs: (json['tafsirs'] as List<dynamic>?)
                ?.map((e) => VerseTafsir.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'verse_number': verseNumber,
        'page_number': pageNumber,
        'verse_key': verseKey,
        'juz_number': juzNumber,
        'hizb_number': hizbNumber,
        'rub_el_hizb_number': rubElHizbNumber,
        'sajdah_type': sajdahType,
        'sajdah_number': sajdahNumber,
        'words': words?.map((e) => e.toJson()).toList(),
        'translations': translations?.map((e) => e.toJson()).toList(),
        'tafsirs': tafsirs?.map((e) => e.toJson()).toList(),
      };
}
