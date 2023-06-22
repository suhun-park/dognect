import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dognect/user/provider/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:provider/provider.dart';
import '../model/free_board_model.dart';

class FreeBoardProvider with ChangeNotifier{
  List<FreeBoardModel> freeBoardData = [];
  final DateTime now = DateTime.now();



  Stream<List<FreeBoardModel>> createStream() {
    return FirebaseFirestore.instance.collection('freeBoard').doc('category').collection('writer').orderBy('dateTime',descending: true).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => FreeBoardModel.fromJson(doc.data())).toList();
    });
  }


  Future<List<FreeBoardModel>> fetchFreeBoardData() async {
    CollectionReference<Map<String, dynamic>> collectionReference = FirebaseFirestore.instance.collection("freeBoard");
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await collectionReference.orderBy('dateTime').get();

      for (var element in querySnapshot.docs) {
        freeBoardData.add(FreeBoardModel.fromJson(element.data()));
    }
    return freeBoardData;
  }


  Future<void> addLike(BuildContext context,String boardId) async{
    final likeCheck = FirebaseFirestore.instance.collection('collectionName').doc('category').collection('like');
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final likeCheckData = await likeCheck.where("uid",isEqualTo: userProvider.userMyModelData[0].uid).where("boardId",isEqualTo: boardId).get();
     if(likeCheckData.size == 0){
      await FirebaseFirestore.instance
          .collection('freeBoard')
          .doc('category')
          .collection('writer')
          .doc(boardId)
          .update({'likeCount': FieldValue.increment(1)});

      await FirebaseFirestore.instance
          .collection('freeBoard')
          .doc('category')
          .collection('like')
          .doc()
          .set({
        "uid": userProvider.userMyModelData[0].uid,
        "boardId": boardId,
      });}else{

     };
    }
  Stream<List<FreeBoardModel>> likeStream() {
    return FirebaseFirestore.instance.collection('freeBoard').doc('category').collection('like').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => FreeBoardModel.fromJson(doc.data())).toList();
    });
  }



}