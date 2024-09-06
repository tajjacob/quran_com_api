import 'package:quran_com_api/src/features/verses/data/verse_pagination_model.dart';

import 'verse_model.dart';

class VerseByChapter {
  final List<Verse>? verses;
  final VersePagination? pagination;

  VerseByChapter({
    this.verses,
    this.pagination,
  });

  factory VerseByChapter.fromJson(Map<String, dynamic> json) => VerseByChapter(
    verses: (json['verses'] as List<dynamic>?)
            ?.map((e) => Verse.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    pagination: json['pagination'] == null
            ? null
            : VersePagination.fromJson(json['pagination']),
  );

  Map<String, dynamic> toJson() => {
    'verses': verses?.map((e) => e.toJson()).toList(),
    'pagination': pagination?.toJson(),
  };
}