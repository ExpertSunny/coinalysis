import 'dart:io';
import 'package:coinalysis/data/app_exceptions.dart';
import 'package:coinalysis/data/network/BaseApiService.dart';
import 'package:dio/dio.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getGETResponse(String url) async {
    dynamic responseJson;
    try {
      Dio dio = Dio();
      final response = await dio.get(url).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on DioException catch (e) {
      if (e.response != null) {
        // Handle DioError with response (e.response)
        responseJson = returnResponse(e.response!);
      } else {
        // Handle DioError without response (e.error)
        throw FetchDataException('No internet connection');
      }
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }

  @override
  Future getPOSTResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Dio dio = Dio();
      Response response =
          await dio.post(url, data: data).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on DioException catch (e) {
      if (e.response != null) {
        // Handle DioError with response (e.response)
        responseJson = returnResponse(e.response!);
      } else {
        // Handle DioError without response (e.error)
        throw FetchDataException('No internet connection');
      }
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.data; // Return response data directly
      default:
        throw FetchDataException(
            "Error occurred while communicating with status code: " +
                response.statusCode.toString());
    }
  }
}
