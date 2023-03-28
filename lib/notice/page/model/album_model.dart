class AlbumModel {
  String? date;
  String? title;

  AlbumModel ({
    required this.date,
    required this.title,
});
  AlbumModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    title = json['title'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    date = data['date'];
    title = data['title'];

    return data;
  }
}