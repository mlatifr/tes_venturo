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
          color: Color.fromARGB(255, 41, 109, 158),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
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
                            builder: (BuildContext context, _provider, child) =>
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
                                            Text('Rp ${value.diskon}'),
                                        ],
                                      )),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.arrow_right_outlined))
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.tab,
                                  color: Color.fromRGBO(0, 154, 173, 1)),
                              Text('Voucher'),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              print('to select voucher');
                              showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: 200,
                                    // color: Colors.amber,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          const Text('Masukan Voucher'),
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: TextFormField(
                                              controller:
                                                  widget.controllerVoucher,
                                            ),
                                          ),
                                          ElevatedButton(
                                            child:
                                                const Text('Close BottomSheet'),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Row(
                              children: const [
                                Text('Rp 8.000'),
                                Icon(Icons.arrow_right_outlined)
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text('Sub Total'),
                          Text('Rp 40.000'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text('PB1 (10%)'),
                          Text('Rp 40.000'),
                        ],
                      ),
                    ]),
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Container(
                  // constraints: BoxConstraints(
                  //     maxHeight: MediaQuery.of(context).size.height * .20,
                  //     minHeight: MediaQuery.of(context).size.height * .1),
                  color: const Color.fromARGB(255, 246, 245, 236),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.shopping_bag_outlined),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('Total Pembayaran'),
                                Text('Rp 36.000'),
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
