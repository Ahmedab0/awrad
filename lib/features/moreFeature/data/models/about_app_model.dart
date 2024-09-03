import 'Data.dart';

class AboutAppModel {
  String? key;
  Data? data;
  String? msg;
  int? code;

  AboutAppModel({
      this.key, 
      this.data, 
      this.msg, 
      this.code,});

  AboutAppModel.fromJson(dynamic json) {
    key = json['key'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    msg = json['msg'];
    code = json['code'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['key'] = key;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['msg'] = msg;
    map['code'] = code;
    return map;
  }

}