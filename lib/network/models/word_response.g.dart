// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WordResponse _$WordResponseFromJson(Map<String, dynamic> json) => WordResponse(
      statusCode: json['Status'] as int,
      error: json['Error'] as String,
      result: WordModel.fromJson(json['Result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WordResponseToJson(WordResponse instance) =>
    <String, dynamic>{
      'Status': instance.statusCode,
      'Error': instance.error,
      'Result': instance.result,
    };
