import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/order.dart';

class ListMenuProvider extends ChangeNotifier {
  TextEditingController controllerVoucher = TextEditingController();
  List<Item> listMenu = [];
  List<Order> listOrder = [];
  var totalHarga = 0;

  void totalHargaAdd(int itemPrice) {
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
        Uri.parse('http://192.168.1.56:7070/api/menus/'),
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
