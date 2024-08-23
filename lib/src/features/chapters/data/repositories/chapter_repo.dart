import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../../quran_com_api.dart';
import '../../../../core/network/api_base_helper.dart';

abstract class ChapterRepoInterface {
  factory ChapterRepoInterface() => ChapterRepo();
  Future<List<Chapter>?> getChapterList({String? language});
  Future<Chapter?> getChapter({
    required int chapter,
    String? language,
  });
  Future<ChapterInfo?> getChapterInfo({
    required int chapter,
    String? language,
  });
}

class ChapterRepo implements ChapterRepoInterface {
  String chapterListUrl = APIConstants.chapterListUrl;

  @override
  Future<List<Chapter>?> getChapterList({String? language}) async {
    var json = {
      'language': language,
    };
    List<Chapter>? chapterList;
    APIBaseHelper api = APIBaseHelper();
    final dio = await api.getDio();
    try {
      final response = await dio.get(
        chapterListUrl,
        queryParameters: json,
      );
      chapterList = (response.data['chapters'] as List)
          .map((e) => Chapter.fromJson(e))
          .toList();
    } on DioException catch (e) {
      log('dio exception: $e');
    }
    return chapterList;
  }

  @override
  Future<Chapter?> getChapter({
    required int chapter,
    String? language,
  }) async {
    var json = {
      'language': language,
    };
    Chapter? chapterData;
    APIBaseHelper api = APIBaseHelper();
    final dio = await api.getDio();
    try {
      final response = await dio.get(
        '$chapterListUrl/$chapter',
        queryParameters: json,
      );
      chapterData = Chapter.fromJson(response.data['chapter']);
    } on DioException catch (e) {
      log('dio exception: $e');
    }
    return chapterData;
  }

  @override
  Future<ChapterInfo?> getChapterInfo({
    required int chapter,
    String? language,
  }) async {
    var json = {
      'language': language,
    };
    ChapterInfo? chapterData;
    APIBaseHelper api = APIBaseHelper();
    final dio = await api.getDio();
    try {
      final response = await dio.get(
        '$chapterListUrl/$chapter/info',
        queryParameters: json,
      );
      chapterData = ChapterInfo.fromJson(response.data['chapter_info']);
    } on DioException catch (e) {
      log('dio exception: $e');
    }
    return chapterData;
  }
}
