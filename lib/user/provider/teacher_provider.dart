import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dognect/user/login/component/data/data.dart';
import 'package:dognect/user/model/teacher_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart'as kakao_user;

class TeacherProvider with ChangeNotifier{
  kakao_user.User? kuser;
  List<TeacherModel> teacherModelData = [];
  final storage = FlutterSecureStorage();

  Future<List<TeacherModel>> userDataGet() async {
  CollectionReference<Map<String, dynamic>> collectionReference =
  FirebaseFirestore.instance.collection("user");
  QuerySnapshot<Map<String, dynamic>> querySnapshot =
  await collectionReference
      .where('uid', isEqualTo: await storage.read(key: COMMON_TOKEN_KEY)).get();
  if(teacherModelData.isEmpty) {
    for (var element in querySnapshot.docs) {
      teacherModelData.add(TeacherModel.fromJson(element.data()));
    }
  }
  notifyListeners();
  return teacherModelData;
  }
  }
