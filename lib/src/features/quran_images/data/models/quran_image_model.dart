class QuranImage {
  String? quranPage;
  String? quranImage;

  QuranImage({
    this.quranPage,
    this.quranImage,
  });

  QuranImage.fromJson(Map<String, dynamic> json) {
    quranPage = json['quranPage'];
    quranImage = json['quranImage'];
  }
}
