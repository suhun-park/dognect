import 'dart:io';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class AdCarouselSliderProvider with ChangeNotifier {
  int dataLength = 0;
  List<String> urlImage = [];
  int currentPage = 0;
  final CarouselController controller = CarouselController();


  Future<List> getAdvertisement() async {
    //list에 이미지 url을 넣어놓음
    //데이터가 가끔 3개 들어옴수정
      try {
        Reference getFirebaseDataLength =
            FirebaseStorage.instance.ref().child('advertisement/');
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
  void pageController(index){
    currentPage = index;
    notifyListeners();
  }




}