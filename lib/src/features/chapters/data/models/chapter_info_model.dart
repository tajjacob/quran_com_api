// "id": 1, //int?
// "chapter_id": 1, //int?
// "language_name": "english", //String?
// "short_text": "This Surah is named Al- //String?
// "source": "Sayyid Abul Ala Maududi - Tafhim al-Qur'an - The Meaning of the Quran", //String?
// "text": "<h2>Name</h //String?

class ChapterInfo {
  ChapterInfo({
    this.id,
    this.chapterId,
    this.languageName,
    this.shortText,
    this.source,
    this.text,
  });

  final int? id;
  final int? chapterId;
  final String? languageName;
  final String? shortText;
  final String? source;
  final String? text;

  factory ChapterInfo.fromJson(Map<String, dynamic> json) => ChapterInfo(
        id: json['id'] as int?,
        chapterId: json['chapter_id'] as int?,
        languageName: json['language_name'] as String?,
        shortText: json['short_text'] as String?,
        source: json['source'] as String?,
        text: json['text'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'chapter_id': chapterId,
        'language_name': languageName,
        'short_text': shortText,
        'source': source,
        'text': text,
      };
}
