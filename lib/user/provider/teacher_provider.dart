import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dognect/user/model/teacher_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart'as kakao_user;

class TeacherProvider with ChangeNotifier{
  kakao_user.User? kuser;
  List<TeacherModel> teacherModelData = [];

  Future<List<TeacherModel>> userDataGet() async {
  CollectionReference<Map<String, dynamic>> collectionReference =
  FirebaseFirestore.instance.collection("user");
  QuerySnapshot<Map<String, dynamic>> querySnapshot =
  await collectionReference
      .where('TeacherEmail', isEqualTo: kuser?.kakaoAccount?.email).get();
  teacherModelData.clear();
  for (var element in querySnapshot.docs) {
    teacherModelData.add(TeacherModel.fromJson(element.data()));
  }
  print(teacherModelData.length);
  notifyListeners();
  return teacherModelData;
  }
  }
