import 'package:json_annotation/json_annotation.dart';
import '../../models/word_model.dart';

part 'words_list_response.g.dart';

@JsonSerializable()
class WordsListResponse {
  @JsonKey(name: 'Status')
  int statusCode;

  @JsonKey(name: 'Error')
  String error;

  @JsonKey(name: 'Result')
  List<WordModel> result;

  WordsListResponse({required this.statusCode, required this.error, required this.result});

  factory WordsListResponse.fromJson(Map<String, dynamic> json) => _$WordsListResponseFromJson(json);
}
