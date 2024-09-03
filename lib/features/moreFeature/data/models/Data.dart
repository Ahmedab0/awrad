
class Data {
  Data({
      this.content,});

  Data.fromJson(dynamic json) {
    content = json['content'];
  }
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['content'] = content;
    return map;
  }

}