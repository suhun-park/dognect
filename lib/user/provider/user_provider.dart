import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../login/component/data/data.dart';
import '../model/user_model.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart'as kakao_user;

class UserProvider with ChangeNotifier{
  kakao_user.User? kuser;
  List<UserModel> userMyModelData = [];

  Future<List<UserModel>> userDataGet() async {
    final storage = FlutterSecureStorage();
    CollectionReference<Map<String, dynamic>> collectionReference =
    FirebaseFirestore.instance.collection("user");
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await collectionReference
        .where(
      'uid', isEqualTo: await storage.read(key: FIREBASE_TOKEN_KEY),
    ).where('userEmail', isEqualTo: kuser?.kakaoAccount?.email).get();
    userMyModelData.clear();
    for (var element in querySnapshot.docs) {
      userMyModelData.add(UserModel.fromJson(element.data()));
    }
    print(userMyModelData);

    return userMyModelData;
  }
}