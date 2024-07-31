import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:quran_com_api/src/core/constants/api_constants.dart';

import '../../../../core/network/api_base_helper.dart';
import '../models/audio_file_model.dart';

abstract class AudioFileRepoInterface {
  factory AudioFileRepoInterface() => AudioFileRepo();
  Future<AudioFile?> getAudioFile({
    required int reciterId,
    required int chapterNo,
  });
  Future<List<AudioFile>?> getAudioFileList({
    required int reciterId,
  });
}

class AudioFileRepo implements AudioFileRepoInterface {
  String audioFileUrl = APIConstants.audioFileUrl;

  @override
  Future<AudioFile?> getAudioFile({
    required int reciterId,
    required int chapterNo,
  }) async {
    AudioFile? audioFileModel;
    APIBaseHelper api = APIBaseHelper();
    final dio = await api.getDio();
    try {
      final response = await dio.get(
        '$audioFileUrl/$reciterId/$chapterNo',
      );
      audioFileModel = AudioFile.fromJson(response.data['audio_file']);
    } on DioException catch (e) {
      log('dio exception: $e');
    }
    return audioFileModel;
  }

  @override
  Future<List<AudioFile>?> getAudioFileList({
    required int reciterId,
  }) async {
    List<AudioFile>? audioFileListModel;
    APIBaseHelper api = APIBaseHelper();
    final dio = await api.getDio();
    try {
      final response = await dio.get(
        '$audioFileUrl/$reciterId',
      );
      audioFileListModel = (response.data['audio_files'] as List)
          .map((e) => AudioFile.fromJson(e))
          .toList();
    } on DioException catch (e) {
      log('dio exception: $e');
    }
    return audioFileListModel;
  }
}
