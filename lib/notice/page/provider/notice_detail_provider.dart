import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dognect/notice/page/model/notice_model.dart';
import 'package:flutter/material.dart';

class NoticeDetailProvider with ChangeNotifier{

  List<NoticeModel> noticeModelData = [];
  Future<List<NoticeModel>> noticeDataGet() async {
    CollectionReference<Map<String, dynamic>> collectionReference = FirebaseFirestore.instance.collection("notice");
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await collectionReference.get();
    noticeModelData.clear();
    for (var element in querySnapshot.docs) {
      noticeModelData.add(NoticeModel.fromJson(element.data()));
    }
    return noticeModelData;
  }
}