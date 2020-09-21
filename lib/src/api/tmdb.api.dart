import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:movie_app/src/models/result.model.dart';

class TmbdApi {

  String _apikey = '44cd50d100ebb392e1a12b01c68ace98';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  Future<Result> getNowPlaying() async{

    final url = Uri.https(_url, '/3/movie/now_playing', {
      'api_key' : _apikey,
      'language': _language
    });

    final response = await http.get(url);

    return response.statusCode == 200
      ? Result.fromJson( json.decode(response.body))
      : throw Exception('Error on getNowPlaying TmbdApi');
  }

  Future<Result> getPopular() async{

    final url = Uri.https(_url, '/3/movie/popular', {
      'api_key' : _apikey,
      'language': _language
    });

    final response = await http.get(url);

    return response.statusCode == 200
      ? Result.fromJson( json.decode(response.body))
      : throw Exception('Error on getPopular TmbdApi');

  }

  Future<Result> getUpcoming() async{

    final url = Uri.https(_url, '/3/movie/upcoming', {
      'api_key' : _apikey,
      'language': _language
    });

    final response = await http.get(url);

    return response.statusCode == 200
      ? Result.fromJson( json.decode(response.body))
      : throw Exception('Error on getUpcoming TmbdApi');
  }

}