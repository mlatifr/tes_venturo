import 'package:flutter/material.dart';
import 'package:flutter_application_1/voucher.dart';
import 'package:flutter_application_1/provider/item_provider.dart';
import 'package:provider/provider.dart';

class costumBottomBar extends StatefulWidget {
  TextEditingController controllerVoucher;
  costumBottomBar({
    Key? key,
    required this.controllerVoucher,
  }) : super(key: key);

  @override
  State<costumBottomBar> createState() => _costumBottomBarState();
}

class _costumBottomBarState extends State<costumBottomBar> {
  getDiskon() async {
    var ttlHg =
        Provider.of<ListMenuProvider>(context, listen: false).totalHarga;
    Provider.of<ListMenuProvider>(context, listen: false).getDiskon(ttlHg);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getDiskon();
    return BottomAppBar(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        child: Container(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * .25,
              minHeight: MediaQuery.of(context).size.height * .1),
          color: const Color.fromARGB(255, 41, 109, 158),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Container(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * .20,
                      minHeight: MediaQuery.of(context).size.height * .1),
                  color: const Color.fromARGB(255, 222, 229, 234),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: const [
                                Text(
                                  'Total Pesanan',
                                  style: TextStyle(fontWeight: FontWeight.w800),
                                ),
                                Text('(4 Menu)'),
                              ],
                            ),
                            Consumer<ListMenuProvider>(
                              builder:
                                  (BuildContext context, _provider, child) =>
                                      Text(
                                'Rp ${_provider.totalHarga}',
                                style: const TextStyle(
                                    color: Color.fromRGBO(0, 154, 173, 1)),
                              ),
                            ),
                            // Text(
                            //   'Rp ${Provider.of<ListMenuProvider>(context, listen: true).totalHarga}',
                            //   style: TextStyle(
                            //       fontWeight: FontWeight.w800,
                            //       color: Color.fromRGBO(0, 154, 173, 1)),
                            // ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: const [
                                Icon(Icons.percent,
                                    color: Color.fromRGBO(0, 154, 173, 1)),
                                Text('Diskon'),
                                Text('20%'),
                              ],
                            ),
                            Row(
                              children: [
                                Consumer<ListMenuProvider>(
                                    builder: (context, value, child) => Column(
                                          children: [
                                            if (value.totalHarga > 40000)
                                              const Text('Potongan 20%'),
                                            Row(
                                              children: [
                                                if (value.totalHarga > 40000)
                                                  Text(
                                                      'Rp ${value.diskon.toStringAsFixed(0)}'),
                                                if (value.totalHarga > 40000)
                                                  const Icon(Icons
                                                      .chevron_right_outlined)
                                              ],
                                            ),
                                          ],
                                        )),
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(25.0))),
                                // backgroundColor: Colors.black,
                                context: context,
                                isScrollControlled: true,
                                builder: (context) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12.0),
                                            child: Text(
                                              'Masukan kode voucher : hemat / puas',
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom),
                                            child: TextField(
                                              decoration: const InputDecoration(
                                                  hintText: 'kode voucher'),
                                              autofocus: true,
                                              controller:
                                                  widget.controllerVoucher,
                                              onSubmitted: (value) {
                                                Provider.of<ListMenuProvider>(
                                                        context,
                                                        listen: false)
                                                    .setVoucher(value)
                                                    .then((value) => {
                                                          Provider.of<ListMenuProvider>(
                                                                  context,
                                                                  listen: false)
                                                              .getNilaiVoucher()
                                                        });
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                        ],
                                      ),
                                    ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: const [
                                  Icon(Icons.tab,
                                      color: Color.fromRGBO(0, 154, 173, 1)),
                                  Text('Voucher'),
                                ],
                              ),
                              Row(
                                children: [
                                  Consumer<ListMenuProvider>(
                                      builder: ((context, value, child) =>
                                          Text('Rp ${value.voucherNilai}'))),
                                  Icon(Icons.arrow_forward_ios_sharp)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Container(
                  // constraints: BoxConstraints(
                  //     maxHeight: MediaQuery.of(context).size.height * .100,
                  //     minHeight: MediaQuery.of(context).size.height * .100),
                  color: const Color.fromARGB(255, 246, 245, 236),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.shopping_bag_outlined),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Total Pembayaran'),
                                Consumer<ListMenuProvider>(
                                    builder: (context, value, child) =>
                                        Text('Rp ${value.totalPembayaran}')),
                              ],
                            ),
                          ],
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            child: const Text('Pesan Sekarang'))
                      ]),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
