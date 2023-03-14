class TeacherModel {
  String? location;
  String? phone;
  String? role;
  String? teacherEmail;
  String? teacherPwd;
  String? uid;
  String? dogRole;

  TeacherModel({
    required this.location,
    required this.phone,
    required this.role,
    required this.teacherEmail,
    required this.teacherPwd,
    required this.uid,
    required this.dogRole,

  });

  TeacherModel.fromJson(Map<String, dynamic> json) {
    location = json['location'];
    phone = json['phone'];
    role = json['role'];
    teacherEmail = json['teacherEmail'];
    teacherPwd = json['teacherPwd'];
    uid = json['uid'];
    dogRole = json['dogRole'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    location = data['location'];
    phone = data['phone'];
    role = data['role'];
    teacherEmail = data['teacherEmail'];
    teacherPwd = data['teacherPwd'];
    uid = data['uid'];
    dogRole = data['dogRole'];

    return data;
  }
}
