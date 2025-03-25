//
// language string
//
// Default value: en
//
// Language to fetch word translation in specific language.
// words string
//
// Possible values: [true, false]
//
// Default value: true
//
// Include words of each ayah?
//
// 0 or false will not include words.
//
// 1 or true will include the words.
// translations string
//
// comma separated ids of translations to load for each ayah.
// audio integer
//
// Id of recitation if you want to load audio of each ayah.
// tafsirs string
//
// Comma separated ids of tafisrs to load for each ayah if you want to load tafisrs.
// word_fields string
//
// Comma separated list of word fields if you want to add more fields for each word.
// translation_fields string
//
// Comma separated list of translation fields if you want to add more fields for each translation.
// fields string
//
// comma separated list of ayah fields.
// page integer
//
// Default value: 1
//
// For paginating within the result
// per_page integer
//
// Possible values: >= 1 and <= 50
//
// Default value: 10
//
// records per api call, you can get maximum 50 records.

class VerseByChapterParam {
  final String? language;
  final bool? words;
  final String? translations;
  final int? audio;
  final String? tafsirs;
  final List<String>? wordFields;
  final String? translationFields;
  final String? fields;
  final int? page;
  final int? perPage;

  VerseByChapterParam({
    this.language,
    this.words,
    this.translations,
    this.audio,
    this.tafsirs,
    this.wordFields,
    this.translationFields,
    this.fields,
    this.page,
    this.perPage,
  });

  Map<String, dynamic> toJson() => {
        'language': language,
        'words': words,
        'translations': translations,
        'audio': audio,
        'tafsirs': tafsirs,
        'word_fields': wordFields,
        'translation_fields': translationFields,
        'fields': fields,
        'page': page,
        'per_page': perPage,
      };
}
