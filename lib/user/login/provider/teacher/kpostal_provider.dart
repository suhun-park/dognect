import 'package:flutter/cupertino.dart';

import 'package:kpostal/kpostal.dart';

class KpostalProvider with ChangeNotifier{
  String postCode = '-';
  String address = '-';
  String latitude = '-';
  String longitude = '-';
  String kakaoLatitude = '-';
  String kakaoLongitude = '-';

   void kpostalCallBack(Kpostal result) {
    postCode = result.postCode;
    address = result.address;
    latitude = result.latitude.toString();
    longitude = result.longitude.toString();
    kakaoLatitude = result.kakaoLatitude.toString();
    kakaoLongitude = result.kakaoLongitude.toString();
    notifyListeners();
  }

}