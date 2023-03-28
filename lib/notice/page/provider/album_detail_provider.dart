import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dognect/notice/page/model/album_model.dart';
import 'package:dognect/user/provider/user_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlbumDetailProvider with ChangeNotifier{

  List<String> urlImage = [];

  List<AlbumModel> albumModelData = [];


  Future<List<AlbumModel>> albumDataGet() async {
    CollectionReference<Map<String, dynamic>> collectionReference = FirebaseFirestore.instance.collection("album");
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await collectionReference.get();
    if(albumModelData.isEmpty){
      for (var element in querySnapshot.docs) {

        albumModelData.add(AlbumModel.fromJson(element.data()));
      }
    }

    return albumModelData;
  }

  Future<List> getAlbumImageGet(BuildContext context) async { //데이터가 계속 호출됨 하 안고쳐짐,,
    final userProvider = Provider.of<UserProvider>(context,listen: false);
    //list에 이미지 url을 넣어놓음
    //데이터가 가끔 3개 들어옴수정
    if(urlImage.isEmpty){
      try {
      Reference getFirebaseDataLength =
      FirebaseStorage.instance.ref().child('album/병아리/HGnROixTJ8Q5dEASINMQ40TUaRj2/${albumModelData[0].date}');
      ListResult result = await getFirebaseDataLength.listAll();

      for(Reference ref in result.items) {
        String downloadUrl = await ref.getDownloadURL();
         urlImage.add(downloadUrl);
      }

    } catch (e) {
      print(e);
    }
    }
    // 중복된 값을 제거합니다.
    return urlImage.toSet().toList();
  }
}