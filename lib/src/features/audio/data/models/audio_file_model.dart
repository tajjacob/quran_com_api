class AudioFile {
  final int? id;
  final int? chapterId;
  final double? fileSize;
  final String? format;
  final int? totalFiles;
  final String? audioUrl;

  AudioFile({
    this.id,
    this.chapterId,
    this.fileSize,
    this.format,
    this.totalFiles,
    this.audioUrl,
  });

  factory AudioFile.fromJson(Map<String, dynamic> json) {
    return AudioFile(
      id: json['id'],
      chapterId: json['chapter_id'],
      fileSize: json['file_size'],
      format: json['format'],
      totalFiles: json['total_files'],
      audioUrl: json['audio_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'chapter_id': chapterId,
      'file_size': fileSize,
      'format': format,
      'total_files': totalFiles,
      'audio_url': audioUrl,
    };
  }
}
