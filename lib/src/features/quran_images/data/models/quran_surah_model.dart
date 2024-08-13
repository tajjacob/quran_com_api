class QuranSurah {
  final String? index;
  final String? ayas;
  final String? start;
  final String? end;
  final String? name;
  final String? tname;
  final String? ename;
  final String? type;
  final String? order;
  final String? orderalphabet;
  final String? orderquran;
  final String? word;
  final String? theletter;
  final String? startjuz;
  final String? endjuz;
  final String? startpage;
  final String? endpage;

  QuranSurah({
    this.index,
    this.ayas,
    this.start,
    this.end,
    this.name,
    this.tname,
    this.ename,
    this.type,
    this.order,
    this.orderalphabet,
    this.orderquran,
    this.word,
    this.theletter,
    this.startjuz,
    this.endjuz,
    this.startpage,
    this.endpage,
  });

  factory QuranSurah.fromJson(Map<String, dynamic> json) {
    return QuranSurah(
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
