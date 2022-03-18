// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../model/item.dart';
// import 'package:logging/logging.dart' as logging;

// class ItemProvider extends ChangeNotifier {
//   static final _log = logging.Logger('OrderProvider');
//   static const headers = {"Content-Type": "application/json", "token": "m_app"};

//   // static List<Item> _listItem = [];
//   // List<Item> get listItem => _listItem;
//   static MenuList? _menuList;
//   MenuList? get menuList => _menuList;

//   Future<MenuList?> getListMenu() async {
//     print('provider : getListMenu');
//     try {
//       print('try');
//       final _api = Uri.http("http", "://192.168.1.62/api/menus");
//       final response = await http.get(_api, headers: headers);
//       print('response: ${response.body}');
//       if (response.statusCode == 200 &&
//           json.decode(response.body)["status_code"] == 200) {
//         _menuList = menuListFromJson(response.body);
//         if (_menuList != null) _log.fine("Success get all menu");
//         notifyListeners();
//         return _menuList;
//       }

//       _log.info("Fail to get all menu");
//       _log.info(response.body);
//       return null;
//     } catch (e) {
//       return null;
//     }
//   }
// }
