import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/role_model.dart';

class DropDownController extends GetxController {
  String dropDownValue = '';
  List<RoleModel> roleModelData = [];
  List<String> roleData = [];
  int dataLength = 0;

  @override
  void onInit() {
    super.onInit();
    roleDataGet();
  }

  Future<List<RoleModel>> roleDataGet() async {
    CollectionReference<Map<String, dynamic>> collectionReference = FirebaseFirestore.instance.collection("roles");
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await collectionReference.get();
    roleModelData.clear();
    for (var element in querySnapshot.docs) {
      roleModelData.add(RoleModel.fromJson(element.data()));
    }
    roleData = roleModelData.map((role) => role.role!).toList();

    dataLength = roleModelData.length;
    dropDownValue = roleData.first;
    update();

    return roleModelData;
  }

  void dropDownValueChange(String value) {
    dropDownValue = value;
    update();
  }
}