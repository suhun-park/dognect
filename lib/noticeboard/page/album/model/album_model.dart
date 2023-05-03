import 'package:flutter/cupertino.dart';

class AlbumModel {
  String? uid;
  String? title;
  String? image;
  String? userImage;
  String? content;

  AlbumModel({
    required this.uid,
    required this.title,
    required this.image,
    required this.userImage,
    required this.content,
});
  AlbumModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    title = json['title'];
    image = json['image'];
    userImage = json['userImage'];
    content = json['content'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    uid = data['uid'];
    title = data['title'];
    image = data['image'];
    userImage = data['userImage'];
    content = data['content'];
    return data;
  }

}