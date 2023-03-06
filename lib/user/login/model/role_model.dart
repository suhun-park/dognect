class RoleModel {
  String? role;



  RoleModel(
      {required this.role,
      });

  RoleModel.fromJson(Map<String, dynamic> json) {
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role'] = role;
    return data;
  }
}
