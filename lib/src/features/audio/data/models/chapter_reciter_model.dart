class ChapterReciter {
  final int? id;
  final String? name;
  final String? arabicName;
  final String? relativePath;
  final String? format;
  final double? filesSize;

  ChapterReciter({
    this.id,
    this.name,
    this.arabicName,
    this.relativePath,
    this.format,
    this.filesSize,
  });

  factory ChapterReciter.fromJson(Map<String, dynamic> json) {
    return ChapterReciter(
      id: json['id'],
      name: json['name'],
      arabicName: json['arabic_name'],
      relativePath: json['relative_path'],
      format: json['format'],
      filesSize: json['files_size'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'arabic_name': arabicName,
      'relative_path': relativePath,
      'format': format,
      'files_size': filesSize,
    };
  }
}
