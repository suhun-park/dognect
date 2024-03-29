class UserModel {
  String? nickName;
  String? petName;
  String? role;
  String? userEmail;
  String? userPwd;
  String? uid;
  String? kinderGarden;
  String? profileImage;

  UserModel({
    required this.nickName,
    required this.petName,
    required this.role,
    required this.userEmail,
    required this.userPwd,
    required this.uid,
    required this.kinderGarden,
    required this.profileImage,

  });

  UserModel.fromJson(Map<String, dynamic> json) {
    petName = json['petName'];
    nickName = json['nickName'];
    userEmail = json['userEmail'];
    userPwd = json['userPwd'];
    role = json['role'];
    uid = json['uid'];
    kinderGarden = json['kinderGarden'];
    profileImage = json['profileImage'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    petName = data['petName'];
    nickName = data['nickName'];
    userEmail = data['userEmail'];
    userPwd = data['userPwd'];
    role = data['role'];
    uid = data['uid'];
    kinderGarden = data['kinderGarden'];
    profileImage = data['profileImage'];

    return data;
  }
}
