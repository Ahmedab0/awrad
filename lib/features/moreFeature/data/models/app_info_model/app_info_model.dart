import 'package:equatable/equatable.dart';

import 'data.dart';

class AppInfoModel extends Equatable {
  final String? key;
  final Data? data;
  final String? msg;
  final int? code;

  const AppInfoModel({this.key, this.data, this.msg, this.code});

  factory AppInfoModel.fromJson(Map<String, dynamic> json) => AppInfoModel(
        key: json['key'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
        msg: json['msg'] as String?,
        code: json['code'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'data': data?.toJson(),
        'msg': msg,
        'code': code,
      };

  @override
  List<Object?> get props => [key, data, msg, code];
}
