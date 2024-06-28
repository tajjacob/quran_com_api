// "verse_key": "1:1",
// "url": "Sudais/mp3/001001.mp3"

class AudioSingle {
  final String? verseKey;
  final String? url;

  AudioSingle({
    this.verseKey,
    this.url,
  });

  factory AudioSingle.fromJson(Map<String, dynamic> json) {
    return AudioSingle(
      verseKey: json['verse_key'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'verse_key': verseKey,
      'url': url,
    };
  }
}
