import 'package:equatable/equatable.dart';

class ToggleFavResponse extends Equatable {
  final String? key;
  final String? msg;
  final int? code;

  const ToggleFavResponse({this.key, this.msg, this.code});

  factory ToggleFavResponse.fromJson(Map<String, dynamic> json) {
    return ToggleFavResponse(
      key: json['key'] as String?,
      msg: json['msg'] as String?,
      code: json['code'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'key': key,
        'msg': msg,
        'code': code,
      };

  @override
  List<Object?> get props => [key, msg, code];
}
