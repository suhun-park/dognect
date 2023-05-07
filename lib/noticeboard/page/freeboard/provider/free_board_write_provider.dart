import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dognect/common/data/custom_date_change_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../user/provider/user_provider.dart';

class FreeBoardWriteProvider with ChangeNotifier{
  Key? titleKey = UniqueKey();
  Key? contentKey = UniqueKey();
  String title = '';
  String content = '';
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  String? dropDownItemSelected;
  final docRef = FirebaseFirestore.instance.collection('freeBoard').doc("category").collection("writer").doc();

  String? titleOnChanged(String value) {
    title = value;
    notifyListeners();
    return title;
  }
  String? contentOnChanged(String value) {
    content = value;
    notifyListeners();
    return content;
  }
  Future<void> freeBoardWriteOnSaved(BuildContext context) async{
    final user = Provider.of<UserProvider>(context,listen: false);
    final customDateChangeProvider = Provider.of<CustomDateChangeProvider>(context,listen: false);
    try{
      customDateChangeProvider.freeBoardDateChange();
    await docRef.set({
      "boardId" : docRef.id,
      "likeCount" : 0,
      "commentCount" : 0,
      "dateTime" : DateTime.now(),
      "category" : dropDownItemSelected,
      "uid" : user.userMyModelData[0].uid,
      "title" : title,
      "content" : content,
      "profileImage" : user.userMyModelData[0].profileImage,
      "nickName" : user.userMyModelData[0].nickName,
    });
    context.pop();
    }catch(e){
      print(e);
    }
    contentController.clear();
    titleController.clear();
    dropDownItemSelected = null;

  }
  void dropdownSelectedFunction(String? value) {
    dropDownItemSelected = value!;
    notifyListeners();
  }
}