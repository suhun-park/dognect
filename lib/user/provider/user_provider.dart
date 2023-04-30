import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import '../login/component/data/data.dart';
import '../model/user_model.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart'as kakao_user;

class UserProvider with ChangeNotifier {
  List<UserModel> userMyModelData = [];
  final storage = FlutterSecureStorage();

  Future<List<UserModel>> userDataGet() async {

    final FirebaseAuth auth = FirebaseAuth.instance;
    CollectionReference<Map<String, dynamic>> collectionReference =
    FirebaseFirestore.instance.collection("user");
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await collectionReference
        .where('uid', isEqualTo: await storage.read(key: COMMON_TOKEN_KEY))
        .get();
    for (var element in querySnapshot.docs) {
      userMyModelData.add(UserModel.fromJson(element.data()));
      print(userMyModelData[0]);
    }
    notifyListeners();
    return userMyModelData;
  }

  void clearUserData() {
    userMyModelData.clear();
    notifyListeners();
  }
}