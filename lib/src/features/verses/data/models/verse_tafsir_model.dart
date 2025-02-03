class VerseTafsir {
  VerseTafsir({
    this.id,
    this.languageName,
    this.name,
    this.text,
  });

  final int? id;
  final String? languageName;
  final String? name;
  final String? text;

  factory VerseTafsir.fromJson(Map<String, dynamic> json) => VerseTafsir(
        id: json['id'] as int?,
        languageName: json['language_name'] as String?,
        name: json['name'] as String?,
        text: json['text'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'language_name': languageName,
        'name': name,
        'text': text,
      };
}
