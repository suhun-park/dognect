import 'package:dognect/user/provider/user_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class HomeProvider with ChangeNotifier{
   String userImage = '';
   DateTime? customDateTime = DateTime.now();
   String formatData = '';



  void customDateChange() {
    formatData = DateFormat('yyyy.MM.dd EEEE','ko').format(customDateTime!).toString();
  }
}