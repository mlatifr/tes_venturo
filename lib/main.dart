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
  bool _loading = false;

  Future<void> getMenu() async {
    print('get menu');
    var _duration = const Duration(seconds: 0);

    await Provider.of<ListMenuProvider>(context, listen: false).bacaDataMenu();
  }

  @override
  void initState() {
    getMenu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: ListMenuProvider(),
        builder: (_, snapshot) {
          var lm = Provider.of<ListMenuProvider>(context).listMenu;
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
                    itemCount: lm.length,
                    itemBuilder: (context, index) {
                      // return Text(
                      //     '${Provider.of<ListMenuProvider>(context).listMenu[index].nama}');
                      return WidgetCardItem(item: lm[index]);
                    }),
              ),
              bottomNavigationBar: const costumBottomBar(),
            ),
          );
        });
  }
}
