
class CategoryModel {
  int? id;
  dynamic image;
  String? name;
  String? description;
  CategoryModel({
      this.id, 
      this.image, 
      this.name, 
      this.description,});

  CategoryModel.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    map['name'] = name;
    map['description'] = description;
    return map;
  }

}