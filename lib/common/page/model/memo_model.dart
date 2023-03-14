class MemoModel {
  String? memo;
  String? dateTime;

  MemoModel({
    required this.memo,
    required this.dateTime,
  });

  MemoModel.fromJson(Map<String, dynamic> json) {
    memo = json['memo'];
    dateTime = json['dateTime'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    memo = data['memo'];
    dateTime = data['dateTime'];

    return data;
  }
}
