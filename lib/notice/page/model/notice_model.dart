class NoticeModel {
  String? date;
  String? content;
  String? title;

  NoticeModel({
    required this.date,
    required this.content,
    required this.title,
  });

  NoticeModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    content = json['content'];
    title = json['title'];


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    date = data['date'];
    content = data['content'];
    title = data['title'];

    return data;
  }
}