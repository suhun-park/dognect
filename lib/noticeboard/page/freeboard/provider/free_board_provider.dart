import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dognect/user/provider/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
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
    final userProvider = Provider.of<UserProvider>(context,listen: false);
  await FirebaseFirestore.instance.collection('freeBoard').doc('category').collection('like').doc().set({
    "uid" : userProvider.userMyModelData[0].uid,
    "boardId" : boardId,
  });
  }



}