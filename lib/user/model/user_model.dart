class UserModel {
  String? nickName;
  String? petName;
  String? role;
  String? userEmail;
  String? userImage;
  String? userPwd;
  String? uid;

  UserModel({
    required this.nickName,
    required this.petName,
    required this.role,
    required this.userEmail,
    required this.userImage,
    required this.userPwd,
    required this.uid,

  });

  UserModel.fromJson(Map<String, dynamic> json) {
    petName = json['petName'];
    nickName = json['nickName'];
    userEmail = json['userEmail'];
    userImage = json['userImage'];
    userPwd = json['userPwd'];
    role = json['role'];
    uid = json['uid'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    petName = data['petName'];
    nickName = data['nickName'];
    userEmail = data['userEmail'];
    userImage = data['userImage'];
    userPwd = data['userPwd'];
    role = data['role'];
    uid = data['uid'];

    return data;
  }
}
