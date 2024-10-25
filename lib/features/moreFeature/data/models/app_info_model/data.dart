import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final String? content;

  const Data({this.content});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        content: json['content'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'content': content,
      };

  @override
  List<Object?> get props => [content];
}
