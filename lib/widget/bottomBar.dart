import 'package:flutter/material.dart';
import 'package:flutter_application_1/voucher.dart';

class costumBottomBar extends StatelessWidget {
  const costumBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        child: Container(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * .25,
              minHeight: MediaQuery.of(context).size.height * .1),
          color: const Color.fromARGB(255, 179, 190, 198),
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
                          const Text(
                            'Rp 40.000',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Color.fromRGBO(0, 154, 173, 1)),
                          ),
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
                              const Text('Rp 8.000'),
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const VoucherPage()),
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
