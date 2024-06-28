class AudioSingleParam {
  final String? fields;
  final int? chapterNumber;
  final int? juzNumber;
  final int? pageNumber;
  final int? hizbNumber;
  final int? rubElHizbNumber;
  final String? verseKey;

  AudioSingleParam({
    this.fields,
    this.chapterNumber,
    this.juzNumber,
    this.pageNumber,
    this.hizbNumber,
    this.rubElHizbNumber,
    this.verseKey,
  });

  Map<String, dynamic> toJson() {
    return {
      'fields': fields,
      'chapter_number': chapterNumber,
      'juz_number': juzNumber,
      'page_number': pageNumber,
      'hizb_number': hizbNumber,
      'rub_el_hizb_number': rubElHizbNumber,
      'verse_key': verseKey,
    };
  }
}
