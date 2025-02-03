import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../../quran_com_api.dart';
import '../../../../core/network/api_base_helper.dart';
import '../../domain/params/verse_by_chapter_param.dart';

abstract class VerseRepoInterface {
  factory VerseRepoInterface() => VerseRepo();
  Future<Verses?> getVerseByChapter({
    required int chapter,
    VerseByChapterParam? params,
  });
}

class VerseRepo implements VerseRepoInterface {
  String chapterListUrl = APIConstants.chapterListUrl;
  String verseByChapterListUrl = APIConstants.verseByChapterListUrl;

  @override
  Future<Verses?> getVerseByChapter({
    required int chapter,
    VerseByChapterParam? params,
  }) async {
    Verses? verses;
    APIBaseHelper api = APIBaseHelper();
    final dio = await api.getDio();
    try {
      final response = await dio.get(
        '$verseByChapterListUrl/$chapter',
        queryParameters: params?.toJson(),
      );
      verses = Verses.fromJson(response.data);
    } on DioException catch (e) {
      log('dio exception: $e');
    }
    return verses;
  }
}
