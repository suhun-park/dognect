import 'package:carousel_slider/carousel_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../model/teacher_talk_model.dart';

class TeacherTalkDetailProvider with ChangeNotifier{
  List<TeacherTalkModel> teacherTalkData = [];
  List<String> teacherTalkImageData = [];
  String downloadUrl = '';
  final CarouselController controller = CarouselController();
  int currentPage = 0;

  Future<List<TeacherTalkModel>> teacherTalkDataGet() async {
    Query<Map<String, dynamic>> collectionReference = FirebaseFirestore.instance.collection("teacherTalk").orderBy('date');
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await collectionReference.get();
    if(teacherTalkData.isEmpty) {
      for (var element in querySnapshot.docs) {
        teacherTalkData.add(TeacherTalkModel.fromJson(element.data()));
      }
    }
    return teacherTalkData;
  }

  Future<List> getTeacherTalkImageGet(BuildContext context) async {
    if (teacherTalkImageData.isEmpty) {
      try {
        Reference getFirebaseDataLength = FirebaseStorage.instance.ref().child('teacherTalk/냥냥이고등학교');
        ListResult result = await getFirebaseDataLength.list();
        String downloadUrl;
        for (Reference ref in result.items) {
          downloadUrl = await ref.getDownloadURL();
          teacherTalkImageData.add(downloadUrl);
        }
      } catch (e) {
        print(e);
      }
    }

    // 중복된 값을 제거합니다.
    return teacherTalkImageData.toSet().toList();
  }
  void pageController(index){
    currentPage = index;
    notifyListeners();
  }
}