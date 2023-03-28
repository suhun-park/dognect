class TeacherTalkModel{
  String? content;
  String? date;
  String? manager;
  String? name;
  String? phone;
  TeacherTalkModel({
    required this.content,
    required this.date,
    required this.phone,
    required this.name,
    required this.manager,
});
  TeacherTalkModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    content = json['content'];
    phone = json['phone'];
    name = json['name'];
    manager = json['manager'];


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    date = data['date'];
    content = data['content'];
    phone = data['phone'];
    name = data['name'];
    manager = data['manager'];

    return data;
  }

}