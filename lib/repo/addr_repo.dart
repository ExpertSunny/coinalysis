import 'package:coinalysis/data/network/BaseApiService.dart';
import 'package:coinalysis/data/network/NetworkApiService.dart';
import 'package:coinalysis/model/trans.dart';
import 'package:coinalysis/res/urls.dart';

class AddrRepo {
  BaseApiService _apiService = NetworkApiService();
  Future<BitcoinTransaction> addrApi(String addr) async {
    try {
      dynamic response =
          await _apiService.getGETResponse(Urls.addrEndPoint + addr);
      // print(Urls.addrEndPoint + addr);
      // print(response);
      return response = BitcoinTransaction.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
