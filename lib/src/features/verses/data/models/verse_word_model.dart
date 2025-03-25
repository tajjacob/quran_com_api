import 'verse_word_trans_model.dart';

class VerseWord {
  final int? id;
  final int? position;
  final String? audioUrl;
  final String? charTypeName;
  final String? textUthmani;
  final String? textUthmaniSimple;
  final String? textImlaei;
  final String? textImlaeiSimple;
  final String? textIndopak;
  final String? textUthmaniTajweed;
  final int? lineNumber;
  final int? pageNumber;
  final String? codeV1;
  final String? text;
  final VerseWordTrans? translation;
  final VerseWordTrans? transliteration;

  VerseWord({
    this.id,
    this.position,
    this.audioUrl,
    this.charTypeName,
    this.textUthmani,
    this.textUthmaniSimple,
    this.textImlaei,
    this.textImlaeiSimple,
    this.textIndopak,
    this.textUthmaniTajweed,
    this.lineNumber,
    this.pageNumber,
    this.codeV1,
    this.text,
    this.translation,
    this.transliteration,
  });

  factory VerseWord.fromJson(Map<String, dynamic> json) => VerseWord(
        id: json['id'] as int?,
        position: json['position'] as int?,
        audioUrl: json['audio_url'] as String?,
        charTypeName: json['char_type_name'] as String?,
        textUthmani: json['text_uthmani'] as String?,
        textUthmaniSimple: json['text_uthmani_simple'] as String?,
        textImlaei: json['text_imlaei'] as String?,
        textImlaeiSimple: json['text_imlaei_simple'] as String?,
        textIndopak: json['text_indopak'] as String?,
        textUthmaniTajweed: json['text_uthmani_tajweed'] as String?,
        lineNumber: json['line_number'] as int?,
        pageNumber: json['page_number'] as int?,
        codeV1: json['code_v1'] as String?,
        text: json['text'] as String?,
        translation: json['translation'] == null
            ? null
            : VerseWordTrans.fromJson(json['translation']),
        transliteration: json['transliteration'] == null
            ? null
            : VerseWordTrans.fromJson(json['transliteration']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'position': position,
        'audio_url': audioUrl,
        'char_type_name': charTypeName,
        'text_uthmani': textUthmani,
        'text_uthmani_simple': textUthmaniSimple,
        'text_imlaei': textImlaei,
        'text_imlaei_simple': textImlaeiSimple,
        'text_indopak': textIndopak,
        'text_uthmani_tajweed': textUthmaniTajweed,
        'line_number': lineNumber,
        'page_number': pageNumber,
        'code_v1': codeV1,
        'text': text,
        'translation': translation?.toJson(),
        'transliteration': transliteration?.toJson(),
      };
}
