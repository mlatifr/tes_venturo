// ignore_for_file: unnecessary_const

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/item.dart';
import 'package:flutter_application_1/widget/bottomBar.dart';
import 'package:flutter_application_1/widget/card_item.dart';
import 'package:flutter_application_1/widget/costum_appBar.dart';
import 'package:flutter_application_1/widget/tittle_card.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'provider/item_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Item> _listItem = [];
  List<Item> _listMenu = [];
  _getListMenu() async {
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
    if (_listItem != null) _listItem.clear();
    Future<dynamic> data = _getListMenu();
    data.then((value) {
      Map json = jsonDecode(value);
      if (json['status_code'].toString().contains('200')) {
        for (var i in json['datas']) {
          Item itm = Item.fromJson(i);
          _listItem.add(itm);
          print('nama item: ${itm.nama}');
        }
      }
      setState(() {
        _listMenu = _listItem;
      });
    });
  }

  @override
  void initState() {
    bacaDataMenu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: costumAppBar(
          tittle: 'Pesanan',
          icon: '',
          isLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
              itemCount: _listMenu.length,
              itemBuilder: (context, index) {
                return WidgetCardItem(item: _listMenu[index]);
              }),
        ),
        bottomNavigationBar: const costumBottomBar(),
      ),
    );
  }
}
