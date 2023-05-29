import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'models/word_response.dart';
import 'models/words_list_response.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'http://5.182.5.154:8080/api/')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('word?id={id}&dict={lang}')
  Future<WordResponse> searchById(@Path() int id, @Path() String lang);

  @GET('words')
  Future<WordsListResponse> searchByIds(@Body() Map<String, dynamic> body);

  @GET('search?value={text}&from={fromLang}&to={toLang}')
  Future<WordsListResponse> search(@Path() String text, @Path() String fromLang, @Path() String toLang);

  @POST('report')
  Future<void> addReport(@Body() Map<String, dynamic> body);
}
