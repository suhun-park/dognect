import 'package:carousel_slider/carousel_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

import '../../user/model/teacher_model.dart';

class TeacherCarouselSliderProvider with ChangeNotifier {
  List<TeacherModel> teacherModelData = [];
  int dataLength = 0;
  List<String> urlImage = [];
  int currentPage = 0;
  final CarouselController controller = CarouselController();

  Future<List<TeacherModel>> teacherDataGet() async {
    CollectionReference<Map<String, dynamic>> collectionReference =
        FirebaseFirestore.instance.collection("teacher");
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await collectionReference.get();
    teacherModelData.clear();
    for (var element in querySnapshot.docs) {
      teacherModelData.add(TeacherModel.fromJson(element.data()));
    }
    return teacherModelData;
  }

  Future<List> getAdvertisement() async { //수정할 것
    //list에 이미지 url을 넣어놓음
    //데이터가 가끔 3개 들어옴수정
    try {
      Reference getFirebaseDataLength =
      FirebaseStorage.instance.ref().child('teachers/');
      ListResult result = await getFirebaseDataLength.listAll();
      dataLength =  result.items.length;
      urlImage.clear();
      for(int i = 1; i<= dataLength;i++){
        Reference firebaseStorageRef = FirebaseStorage.instance
            .ref()
            .child('advertisement/$i.png');

        String downloadUrl = await firebaseStorageRef.getDownloadURL();
        urlImage.add(downloadUrl);
      }
    } catch (e) {
      print(e);
    }
    urlImage.toSet(); // 중복된 값을 제거합니다.
    return urlImage.toList();
  }

}