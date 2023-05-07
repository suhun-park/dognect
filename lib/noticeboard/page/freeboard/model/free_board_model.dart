import 'package:cloud_firestore/cloud_firestore.dart';

class FreeBoardModel {
  final DateTime now = DateTime.now();
  String elapsedTime = '';
   String? category;
   String? content;
   String? title;
   String? uid;
   Timestamp? dateTime;
   int? likeCount;
   String? profileImage;
   String? nickName;
   int? commentCount;
   String? boardId;


  FreeBoardModel({
     required this.content,
    required this.category,
    required this.title,
    required this.uid,
    required this.dateTime,
    required this.likeCount,
    required this.profileImage,
    required this.nickName,
    required this.commentCount,
    required this.boardId,
});
  FreeBoardModel.fromJson(Map<String,dynamic> json){
    category = json['category'] ;
    content = json['content'];
    title = json['title'];
    uid = json['uid'];
    dateTime =  json['dateTime'];
    likeCount = json['likeCount'] as int;
    profileImage = json['profileImage'];
    nickName = json['nickName'];
    commentCount = json['commentCount'] as int;
    boardId = json['boardId'];
    final Duration difference = now.difference(dateTime!.toDate());
    if (difference.inDays > 0) {
      elapsedTime = '${difference.inDays}일 전';
    } else if (difference.inHours > 0) {
      elapsedTime = '${difference.inHours}시간 전';
    } else if (difference.inMinutes > 0) {
      elapsedTime = '${difference.inMinutes}분 전';
    } else {
      elapsedTime = '방금 전';
    }
   }
   Map<String, dynamic> toJson() {
     final Map<String, dynamic> data = new Map<String, dynamic>();
     category = data['category'];
     content = data['content'];
     title = data['title'];
     uid = data['uid'];
     dateTime = data['dateTime'];
     likeCount = data['likeCount'] as int;
     profileImage = data['profileImage'];
     nickName = data['nickName'];
     commentCount = data['commentCount'] as int;
     boardId = data['boardId'];

     return data;
   }
}