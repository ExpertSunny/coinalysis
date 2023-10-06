import 'dart:convert';
import 'dart:io';
import 'package:coinalysis/data/app_exceptions.dart';
import 'package:coinalysis/data/network/BaseApiService.dart';
import 'package:dio/dio.dart';

Dio dio = Dio();

class NetworkApiService extends BaseApiService {
  @override
  Future getGETResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await dio.get(url).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }

  @override
  Future getPOSTResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response =
          await dio.post(url, data: data).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.data);
        return responseJson;
      default:
        throw FetchDataException(
            "Error occured while communicating with status code" +
                response.statusCode.toString());
    }
  }
}
