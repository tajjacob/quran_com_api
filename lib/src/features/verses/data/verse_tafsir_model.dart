// {
// "id": 82641, //int?
// "language_name": "english", //String?
// "name": "Tafsir Ibn Kathir", //String?
// "text": "<h2 class=\"title\">Which was revealed in Makkah</h2><h2 class=\"title\">The Meaning of Al-Fatihah and its Various Names</h2>" //String?
// }

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
