import 'package:coinalysis/data/network/BaseApiService.dart';
import 'package:coinalysis/data/network/NetworkApiService.dart';
import 'package:coinalysis/res/urls.dart';

class AddrRepo {
  BaseApiService _apiService = NetworkApiService();
  Future<dynamic> addrApi(String addr) async {
    try {
      dynamic response =
          await _apiService.getGETResponse(Urls.addrEndPoint + addr);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
