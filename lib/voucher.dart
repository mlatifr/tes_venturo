import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/costum_appBar.dart';

class VoucherPage extends StatefulWidget {
  const VoucherPage({Key? key}) : super(key: key);

  @override
  State<VoucherPage> createState() => _VoucherPageState();
}

class _VoucherPageState extends State<VoucherPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: costumAppBar(
        tittle: 'Pilih Voucher',
        icon: '',
        isLeading: true,
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: Colors.blue,
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * .12,
                  minHeight: MediaQuery.of(context).size.height * .10),
            ),
          ),
        )
      ]),
    ));
  }
}
