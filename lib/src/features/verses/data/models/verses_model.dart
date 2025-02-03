import 'package:quran_com_api/src/features/verses/data/models/verse_model.dart';

import 'verse_pagination_model.dart';

class Verses {
  List<Verse>? verses;
  VersePagination? pagination;

  Verses({
    this.verses,
    this.pagination,
  });

  factory Verses.fromJson(Map<String, dynamic> json) => Verses(
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
