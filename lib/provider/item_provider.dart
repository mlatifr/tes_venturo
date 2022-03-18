import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/order.dart';

class ListMenuProvider extends ChangeNotifier {
  final String _url = 'https://tes-mobile.landa.id/public/api/';
  TextEditingController controllerVoucher = TextEditingController();
  List<Item> listMenu = [];
  List<Order> listOrder = [];

  double totalHarga = 0;
  double totalPesanan = 0;
  double diskon = 0;
  double totalPembayaran = 0;
  double voucherNilai = 0;
  bool sisaNominalVoucher = true;
  getNilaiVoucher() {
    print('getNilaiVoucher: $voucherNilai ');
    // if (sisaNominalVoucher == false && voucherNilai <= 0) {
    //   voucherNilai = 0.0;
    // }
    return voucherNilai;
  }

  Future<void> setVoucher(String? kodeVoucher) async {
    print(
        'kodeVoucher: $kodeVoucher | sisaNominalVoucher: $sisaNominalVoucher');
    if (kodeVoucher == 'hemat' && sisaNominalVoucher == true) {
      voucherNilai = 10000;
      notifyListeners();
    }
    if (kodeVoucher == 'puas' && sisaNominalVoucher == true) {
      voucherNilai = 100000;
      notifyListeners();
    }
    if (voucherNilai < totalPembayaran ||
        (kodeVoucher == 'hemat' && sisaNominalVoucher == true)) {
      print('voucherNilai < totalPembayaran: $voucherNilai < $totalPembayaran');
      totalPembayaran = totalPesanan - diskon - voucherNilai;
      notifyListeners();
    }
    if (voucherNilai > totalPembayaran && kodeVoucher == 'puas') {
      print('voucherNilai > totalPembayaran: $voucherNilai > $totalPembayaran');
      totalPembayaran = 0;
      voucherNilai = 100000;
      sisaNominalVoucher = false;
      notifyListeners();
    }
  }

  getDiskon(hargaNow) {
    print('hargaNow: $hargaNow');
    if (hargaNow > 40000) {
      diskon = hargaNow * 20 / 100;
      totalPesanan = hargaNow - diskon;
    }
  }

  Future<void> totalHargaAdd(int itemPrice) async {
    totalHarga += itemPrice;
    totalPembayaran = totalHarga - diskon - voucherNilai;
    notifyListeners();
  }

  void totalHargaMin(int itemPrice) {
    totalHarga -= itemPrice;
    totalPembayaran = totalHarga - diskon - voucherNilai;
    notifyListeners();
  }

  getListMenu() async {
    try {
      final response = await http.get(
        Uri.parse('${_url}menus/'),
      );
      if (response.statusCode == 200) {
        print('_getListMenu: ${response.body.runtimeType}');
        return response.body;
      } else {
        print('${response.statusCode}');
      }
    } catch (e) {
      return e;
    }
  }

  Future<void> bacaDataMenu() async {
    print('bacaDataMenu');
    if (listMenu != null) listMenu.clear();
    Future<dynamic> data = getListMenu();
    data.then((value) {
      Map json = jsonDecode(value);
      if (json['status_code'].toString().contains('200')) {
        for (var i in json['datas']) {
          Item itm = Item.fromJson(i);
          listMenu.add(itm);
          print('nama item: ${itm.nama}');
        }
        listMenu = listMenu;
        notifyListeners();
      }
    });
  }
}
