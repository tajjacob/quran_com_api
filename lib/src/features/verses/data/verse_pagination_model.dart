class VersePagination {
  VersePagination({
    this.perPage,
    this.currentPage,
    this.nextPage,
    this.totalPages,
    this.totalRecords,
  });

  final int? perPage;
  final int? currentPage;
  final int? nextPage;
  final int? totalPages;
  final int? totalRecords;

  factory VersePagination.fromJson(Map<String, dynamic> json) =>
      VersePagination(
        perPage: json['per_page'] as int?,
        currentPage: json['current_page'] as int?,
        nextPage: json['next_page'] as int?,
        totalPages: json['total_pages'] as int?,
        totalRecords: json['total_records'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'per_page': perPage,
        'current_page': currentPage,
        'next_page': nextPage,
        'total_pages': totalPages,
        'total_records': totalRecords,
      };
}
