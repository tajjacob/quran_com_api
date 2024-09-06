import 'verse_word_trans_model.dart';

class VerseWord {
  final int? id;
  final int? position;
  final String? audioUrl;
  final String? charTypeName;
  final int? lineNumber;
  final int? pageNumber;
  final String? codeV1;
  final VerseWordTrans? translation;
  final VerseWordTrans? transliteration;

  VerseWord({
    this.id,
    this.position,
    this.audioUrl,
    this.charTypeName,
    this.lineNumber,
    this.pageNumber,
    this.codeV1,
    this.translation,
    this.transliteration,
  });

  factory VerseWord.fromJson(Map<String, dynamic> json) => VerseWord(
        id: json['id'] as int?,
        position: json['position'] as int?,
        audioUrl: json['audio_url'] as String?,
        charTypeName: json['char_type_name'] as String?,
        lineNumber: json['line_number'] as int?,
        pageNumber: json['page_number'] as int?,
        codeV1: json['code_v1'] as String?,
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
        'line_number': lineNumber,
        'page_number': pageNumber,
        'code_v1': codeV1,
        'translation': translation?.toJson(),
        'transliteration': transliteration?.toJson(),
      };
}
