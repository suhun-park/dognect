import 'dart:io';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class AdCarouselSliderProvider with ChangeNotifier {
  int dataLength = 0;
  List<String> advertisementUrlImage = [];
  List<String> eventUrlImage = [];
  int currentPage = 0;
  final CarouselController controller = CarouselController();


  Future<List> getAdvertisement() async {
    //list에 이미지 url을 넣어놓음
    //데이터가 가끔 3개 들어옴수정
    if(advertisementUrlImage.isEmpty) {
      try {
        Reference getFirebaseDataLength =
        FirebaseStorage.instance.ref().child('advertisement/');
        ListResult result = await getFirebaseDataLength.listAll();
        dataLength = result.items.length;
        for (Reference ref in result.items) {
          String downloadUrl = await ref.getDownloadURL();
          advertisementUrlImage.add(downloadUrl);
        }
      } catch (e) {
        print(e);
      }
    }
      // 중복된 값을 제거합니다.
      return advertisementUrlImage.toSet().toList();
  }
  Future<List> getEvent() async {
    if(eventUrlImage.isEmpty) {
      try {
        Reference getFirebaseDataLength =
        FirebaseStorage.instance.ref().child('event/');
        ListResult result = await getFirebaseDataLength.listAll();
        for (Reference ref in result.items) {
          String downloadUrl = await ref.getDownloadURL();
          eventUrlImage.add(downloadUrl);
        }
      } catch (e) {
        print(e);
      }
    }
    // 중복된 값을 제거합니다.
    return eventUrlImage.toSet().toList();

  }
  void pageController(index){
    currentPage = index;
    notifyListeners();
  }




}