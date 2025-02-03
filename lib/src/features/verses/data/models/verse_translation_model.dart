// {
// "resource_id": 131, // int?
// "text": "In the Name of Allah—the Most Compassionate, Most Merciful." // String?
// }

class VerseTranslation {
  VerseTranslation({
    this.resourceId,
    this.text,
  });

  final int? resourceId;
  final String? text;

  factory VerseTranslation.fromJson(Map<String, dynamic> json) =>
      VerseTranslation(
        resourceId: json['resource_id'] as int?,
        text: json['text'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'resource_id': resourceId,
        'text': text,
      };
}
