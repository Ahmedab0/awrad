class CategoryAzkarModel {
  int? id;
  int? categoryId;
  String? title;
  String? content;
  bool? isFav;

   CategoryAzkarModel(
      {this.id, this.categoryId, this.title, this.content, this.isFav});

  CategoryAzkarModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    title = json['title'];
    content = json['content'];
    isFav = json['is_fav'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['title'] = title;
    data['content'] = content;
    data['is_fav'] = isFav;
    return data;
  }
}
