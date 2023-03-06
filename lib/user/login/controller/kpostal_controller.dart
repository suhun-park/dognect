import 'package:get/get.dart';
import 'package:kpostal/kpostal.dart';

class KpostalController extends GetxController{
  String postCode = '-';
  String address = '-';
  String latitude = '-';
  String longitude = '-';
  String kakaoLatitude = '-';
  String kakaoLongitude = '-';

  Kpostal kpostalCallBack(Kpostal result) {
    postCode = result.postCode;
    address = result.address;
    latitude = result.latitude.toString();
    longitude = result.longitude.toString();
    kakaoLatitude = result.kakaoLatitude.toString();
    kakaoLongitude = result.kakaoLongitude.toString();
    update();
    return result;
  }

}