// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'words_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WordsListResponse _$WordsListResponseFromJson(Map<String, dynamic> json) =>
    WordsListResponse(
      statusCode: json['Status'] as int,
      error: json['Error'] as String,
      result: (json['Result'] as List<dynamic>)
          .map((e) => WordModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WordsListResponseToJson(WordsListResponse instance) =>
    <String, dynamic>{
      'Status': instance.statusCode,
      'Error': instance.error,
      'Result': instance.result,
    };
