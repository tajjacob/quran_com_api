import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../../quran_com_api.dart';
import '../../../../core/network/api_base_helper.dart';

abstract class ChapterRepoInterface {
  factory ChapterRepoInterface() => ChapterRepo();
  Future<List<Chapter>?> getChapterList({String? language});
}

class ChapterRepo implements ChapterRepoInterface {
  String chapterListUrl = APIConstants.chapterListUrl;

  @override
  Future<List<Chapter>?> getChapterList({String? language}) async {
    List<Chapter>? chapterList;
    APIBaseHelper api = APIBaseHelper();
    final dio = await api.getDio();
    try {
      final response = await dio.get(chapterListUrl);
      chapterList = (response.data['chapters'] as List)
          .map((e) => Chapter.fromJson(e))
          .toList();
    } on DioException catch (e) {
      log('dio exception: $e');
    }
    return chapterList;
  }
}
