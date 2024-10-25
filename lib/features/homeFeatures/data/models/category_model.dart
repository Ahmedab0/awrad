class CategoryModel {
  int? id;
  String? image;
  String? name;
  String? description;

  CategoryModel({
    this.id,
    this.image,
    this.name,
    this.description,
  });

  CategoryModel.fromJson(Map<String, dynamic>json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['description'] = description;
    return data;
  }
}
