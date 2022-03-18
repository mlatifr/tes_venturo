import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListMenuProvider extends ChangeNotifier {
  List<Item> listMenu = [];
  getListMenu() async {
    final response = await http.get(
      Uri.parse('http://192.168.1.56:7070/api/menus/'),
    );
    if (response.statusCode == 200) {
      print('_getListMenu: ${response.body.runtimeType}');
      return response.body;
    } else {
      throw Exception('Failed to read API');
    }
  }

  bacaDataMenu() {
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
      }
    });
  }
}
