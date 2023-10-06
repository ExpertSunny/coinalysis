import 'package:coinalysis/repo/addr_repo.dart';
import 'package:flutter/material.dart';

class AddrVM with ChangeNotifier {
  final _myrepo = AddrRepo();
  Future<void> addrApi(String addr) async {
    _myrepo.addrApi(addr);
  }
}
