import 'package:dognect/user/provider/user_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class HomeProvider with ChangeNotifier{
   String userImage = '';
   DateTime? customDateTime = DateTime.now();
   String formatData = '';

  Future<String> getUserImage(BuildContext context) async{
    final userProvider = Provider.of<UserProvider>(context);

    final Reference storageRef = FirebaseStorage.instance.ref('users/').child('${userProvider.userMyModelData[0].uid}.png');

    userImage = await storageRef.getDownloadURL();

    return userImage;
  }
  void customDateChange() {
    formatData = DateFormat('yyyy-MM-dd').format(customDateTime!).toString();
  }

}