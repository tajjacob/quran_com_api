// "text": "bis'mi", // String?
// "language_name": "english" // String?

class VerseWordTrans {
  final String? languageName;
  final String? text;

  VerseWordTrans({
    this.languageName,
    this.text,
  });

  factory VerseWordTrans.fromJson(Map<String, dynamic> json) => VerseWordTrans(
        languageName: json['language_name'] as String?,
        text: json['text'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'language_name': languageName,
        'text': text,
      };
}
