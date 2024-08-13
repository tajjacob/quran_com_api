class QuranSuraDetail {
  final String index;
  final String ayas;
  final String start;
  final String? end;
  final String name;
  final String tname;
  final String ename;
  final String type;
  final String order;
  final String? orderalphabet;
  final String? orderquran;
  final String word;
  final String theletter;
  final String startjuz;
  final String endjuz;
  final String startpage;
  final String endpage;

  QuranSuraDetail({
    required this.index,
    required this.ayas,
    required this.start,
    required this.end,
    required this.name,
    required this.tname,
    required this.ename,
    required this.type,
    required this.order,
    required this.orderalphabet,
    required this.orderquran,
    required this.word,
    required this.theletter,
    required this.startjuz,
    required this.endjuz,
    required this.startpage,
    required this.endpage,
  });

  factory QuranSuraDetail.fromJson(Map<String, dynamic> json) {
    return QuranSuraDetail(
      index: json['index'],
      ayas: json['ayas'],
      start: json['start'],
      end: json['end'],
      name: json['name'],
      tname: json['tname'],
      ename: json['ename'],
      type: json['type'],
      order: json['order'],
      orderalphabet: json['orderalphabet'],
      orderquran: json['orderquran'],
      word: json['word'],
      theletter: json['theletter'],
      startjuz: json['startjuz'],
      endjuz: json['endjuz'],
      startpage: json['startpage'],
      endpage: json['endpage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'index': index,
      'ayas': ayas,
      'start': start,
      'end': end,
      'name': name,
      'tname': tname,
      'ename': ename,
      'type': type,
      'order': order,
      'orderalphabet': orderalphabet,
      'orderquran': orderquran,
      'word': word,
      'theletter': theletter,
      'startjuz': startjuz,
      'endjuz': endjuz,
      'startpage': startpage,
      'endpage': endpage,
    };
  }
}
