class ChapterTranslatedName {
  ChapterTranslatedName({
    this.languageName,
    this.name,
  });

  final String? languageName;
  final String? name;

  factory ChapterTranslatedName.fromJson(Map<String, dynamic> json) =>
      ChapterTranslatedName(
        languageName: json['language_name'] as String?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'language_name': languageName,
        'name': name,
      };
}
