class Recitation {
  final int? id;
  final String? reciterName;
  final String? style;
  final TranslatedName? translatedName;

  Recitation({
    this.id,
    this.reciterName,
    this.style,
    this.translatedName,
  });

  factory Recitation.fromJson(Map<String, dynamic> json) {
    return Recitation(
      id: json['id'],
      reciterName: json['reciter_name'],
      style: json['style'],
      translatedName: json['translated_name'] != null
          ? TranslatedName.fromJson(json['translated_name'])
          : null,
    );
  }
}

class TranslatedName {
  final String? name;
  final String? languageName;

  TranslatedName({
    this.name,
    this.languageName,
  });

  factory TranslatedName.fromJson(Map<String, dynamic> json) {
    return TranslatedName(
      name: json['name'],
      languageName: json['language_name'],
    );
  }
}
