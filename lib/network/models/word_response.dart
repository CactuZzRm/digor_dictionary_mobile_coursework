import 'package:json_annotation/json_annotation.dart';
import '../../models/word_model.dart';

part 'word_response.g.dart';

@JsonSerializable()
class WordResponse {
  @JsonKey(name: 'Status')
  int statusCode;

  @JsonKey(name: 'Error')
  String error;

  @JsonKey(name: 'Result')
  WordModel result;

  WordResponse({required this.statusCode, required this.error, required this.result});

  factory WordResponse.fromJson(Map<String, dynamic> json) => _$WordResponseFromJson(json);
}
