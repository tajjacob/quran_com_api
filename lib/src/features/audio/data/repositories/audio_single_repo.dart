import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../../quran_com_api.dart';
import '../../../../core/network/api_base_helper.dart';

abstract class AudioSingleRepoInterface {
  factory AudioSingleRepoInterface() => AudioSingleRepo();
  Future<List<AudioSingle>?> getAudioFileList({
    required int recitationId,
    AudioSingleParam? audioSingleParam,
  });
}

class AudioSingleRepo implements AudioSingleRepoInterface {
  String audioSingleUrl = APIConstants.audioFileList;

  @override
  Future<List<AudioSingle>?> getAudioFileList({
    required int recitationId,
    AudioSingleParam? audioSingleParam,
  }) async {
    List<AudioSingle>? audioSingleList;
    APIBaseHelper api = APIBaseHelper();
    final dio = await api.getDio();

    try {
      final response = await dio.get(
        '$audioSingleUrl/$recitationId',
        queryParameters: audioSingleParam?.toJson(),
      );
      audioSingleList = (response.data['audio_files'] as List)
          .map((e) => AudioSingle.fromJson(e))
          .toList();
    } on DioException catch (e) {
      log('dio exception: $e');
    }
    return audioSingleList;
  }
}
