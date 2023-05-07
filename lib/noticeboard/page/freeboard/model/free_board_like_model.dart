class FreeBoardLikeModel {
  String? uid;
  String? boardId;

  FreeBoardLikeModel({
   required this.uid,
   required this.boardId,
});

  FreeBoardLikeModel.fromJson(Map<String,dynamic>json){
    uid = json['uid'];
    boardId = json['boardId'];
  }
  Map<String,dynamic>toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    uid = data['uid'];
    boardId = data['boardId'];
    return data;
  }
}