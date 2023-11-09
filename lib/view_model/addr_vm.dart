import 'package:coinalysis/model/trans.dart';
import 'package:coinalysis/repo/addr_repo.dart';
import 'package:flutter/material.dart';

class AddrVM with ChangeNotifier {
  final _myrepo = AddrRepo();
  Future<BitcoinTransaction> addrApi(String addr) async {
    return _myrepo.addrApi(addr);
  }
}

// class SlidesVM with ChangeNotifier {
//   final _myRepo = SlidesRepo();

//   ApiResponse<SlidesListModel> slidesList = ApiResponse.loading();

//   setSlidesList(ApiResponse<SlidesListModel> response) {
//     slidesList = response;
//     notifyListeners();
//   }

//   Future<void> fetchSlidesListApi() async {
//     setSlidesList(ApiResponse.loading());

//     _myRepo.fetchSlidesList().then((value) {
//       setSlidesList(ApiResponse.completed(value));
//     }).onError((error, stackTrace) {
//       setSlidesList(ApiResponse.error(error.toString()));
//     });
//   }