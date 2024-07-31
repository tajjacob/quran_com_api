import 'package:quran_com_api/quran_com_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final audioFileProvider = Provider((ref) => AudioFileRepo());

class AudioFileRepo {
  Future<AudioFile?> getAudioFile() async {
    AudioFile? audioFileModel;
    audioFileModel = await AudioFileRepoInterface().getAudioFile(
      reciterId: 1,
      chapterNo: 1,
    );
    return audioFileModel;
  }
}

final audioFileRepoProvider = Provider<AudioFileRepo>((ref) => AudioFileRepo());
