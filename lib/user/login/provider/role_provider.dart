import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../model/role_model.dart';

class RoleProvider with ChangeNotifier {
  String dropDownValue = '';
  List<RoleModel> roleModelData = [];
  List<String> roleData = [];

  @override

  Future<List<RoleModel>> roleDataGet() async {
    CollectionReference<Map<String, dynamic>> collectionReference = FirebaseFirestore.instance.collection("roles");
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await collectionReference.get();
    roleModelData.clear();

    for (var element in querySnapshot.docs) {
      roleModelData.add(RoleModel.fromJson(element.data()));
    }
    roleData = roleModelData.map((role) => role.role!).toList();
    if(dropDownValue.isEmpty){
      dropDownValue = roleData.first;
    }

    return roleModelData;
  }

  void dropDownValueChange(String? value) {
    dropDownValue = value!;
    notifyListeners();
  }
  void roleChoice(BuildContext context) {
    if(dropDownValue == roleData.first) {
      context.push('/userSignUpScreen',extra:dropDownValue);
    }
      else if(dropDownValue == roleData.last){
        context.push('/teacherSignUpScreen');
      }
    }
  }
