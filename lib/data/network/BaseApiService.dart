abstract class BaseApiService {
  Future<dynamic> getGETResponse(String url);
  Future<dynamic> getPOSTResponse(String url, dynamic data);
}
