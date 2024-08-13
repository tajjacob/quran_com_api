import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';

import '../models/quran_image_model.dart';

abstract class QuranImageRepoInterface {
  factory QuranImageRepoInterface() => QuranImageRepo();
  Future<List<QuranImage>> getQuranImagesLocal();
}

class QuranImageRepo implements QuranImageRepoInterface {
  // solution:
  // https://stackoverflow.com/questions/54740732/how-to-add-assets-in-flutter-package-plugin-development
  final String quranImageJson =
      'packages/quran_com_api/assets/json/quran_images.json';

  @override
  Future<List<QuranImage>> getQuranImagesLocal() async {
    List<QuranImage>? quranImageList;
    try {
      final json = await rootBundle.loadString(quranImageJson);
      quranImageList = (jsonDecode(json) as List)
          .map((e) => QuranImage.fromJson(e))
          .toList();
    } catch (e) {
      log('json error: $e');
    }
    return quranImageList!;
  }
}
