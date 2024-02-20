import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../../quran_com_api.dart';
import '../../../../core/network/api_base_helper.dart';

abstract class RecitationRepoInterface {
  factory RecitationRepoInterface() => RecitationRepo();
  Future<List<Recitation>?> getRecitationList({
    required String? language,
  });
}

class RecitationRepo implements RecitationRepoInterface {
  String recitationUrl = APIConstants.recitationUrl;

  @override
  Future<List<Recitation>?> getRecitationList({
    required String? language,
  }) async {
    var json = {
      'language': language,
    };
    List<Recitation>? recitationList;
    APIBaseHelper api = APIBaseHelper();
    final dio = await api.getDio();
    try {
      final response = await dio.get(
        recitationUrl,
        queryParameters: json,
      );
      recitationList = (response.data['recitations'] as List)
          .map((e) => Recitation.fromJson(e))
          .toList();
    } on DioException catch (e) {
      log('dio exception: $e');
    }
    return recitationList;
  }
}
