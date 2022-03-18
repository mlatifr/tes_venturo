// ignore_for_file: unnecessary_const
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/item.dart';
import 'package:flutter_application_1/provider/item_provider.dart';
import 'package:flutter_application_1/widget/bottomBar.dart';
import 'package:flutter_application_1/widget/card_item.dart';
import 'package:flutter_application_1/widget/costum_appBar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ListMenuProvider())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
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
  List<Item> fakeListItem = [];
  // Item fakeItem = Item(
  //     id: 1,
  //     nama: 'fake_nama',
  //     harga: 10000,
  //     tipe: 'tipe',
  //     gambar: 'cecek.jpg',
  //     created_at: 'created_at',
  //     updated_at: 'updated_at',
  //     jumlah: 0);
  bool _loading = false;
  createFakeItem() {
    for (var i = 1; i < 5; i++) {
      Item fakeItem = Item(
          id: 1,
          nama: 'fake_nama $i',
          harga: 10000 * i,
          tipe: 'tipe',
          gambar: 'cecek.jpg',
          created_at: 'created_at',
          updated_at: 'updated_at',
          jumlah: 0);
      fakeListItem.add(fakeItem);
    }
    setState(() {});
  }

  Future<void> getMenu() async {
    print('get menu');
    var _duration = const Duration(seconds: 0);

    await Provider.of<ListMenuProvider>(context, listen: false).bacaDataMenu();
  }

  @override
  void initState() {
    createFakeItem();
    getMenu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: ListMenuProvider(),
        builder: (_, snapshot) {
          var lm = Provider.of<ListMenuProvider>(context);
          return SafeArea(
            child: Scaffold(
              appBar: costumAppBar(
                tittle: 'Pesanan',
                icon: '',
                isLeading: false,
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: snapshot != null
                    ? ListView.builder(
                        itemCount: lm.listMenu.length,
                        itemBuilder: (context, index) {
                          return WidgetCardItem(item: lm.listMenu[index]);
                        })
                    : ListView.builder(
                        itemCount: fakeListItem.length,
                        itemBuilder: (context, index) {
                          return WidgetCardItem(item: fakeListItem[index]);
                        }),
              ),
              bottomNavigationBar: costumBottomBar(
                controllerVoucher: lm.controllerVoucher,
              ),
            ),
          );
        });
  }
}
