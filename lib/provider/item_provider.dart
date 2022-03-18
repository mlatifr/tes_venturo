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
  double diskon = 0;
  double totalHarga = 0;
  double totalPembayaran = 0;
  getDiskon(hargaNow) {
    print('hargaNow: $hargaNow');
    if (hargaNow > 40000) {
      diskon = hargaNow * 20 / 100;
      totalPembayaran = hargaNow - diskon;
    }
  }

  Future<void> totalHargaAdd(int itemPrice) async {
    totalHarga += itemPrice;
    notifyListeners();
  }

  void totalHargaMin(int itemPrice) {
    totalHarga -= itemPrice;
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
