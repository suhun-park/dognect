class MemoModel {
  String? memo;
  String? dateTime;
  String? color;
  String? firstTime;
  String? finalTime;


  MemoModel({
    required this.memo,
    required this.dateTime,
    required this.color,
    required this.firstTime,
    required this.finalTime,
  });

  MemoModel.fromJson(Map<String, dynamic> json) {
    memo = json['memo'];
    dateTime = json['dateTime'];
    color = json['color'];
    firstTime = json['firstTime'];
    finalTime = json['finalTime'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    memo = data['memo'];
    dateTime = data['dateTime'];
    color = data['color'];
    firstTime = data['firstTime'];
    finalTime = data['finalTime'];

    return data;
  }
}
