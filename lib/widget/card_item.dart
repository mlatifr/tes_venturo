import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/item_provider.dart';
import 'package:provider/provider.dart';

import '../model/item.dart';

class WidgetCardItem extends StatefulWidget {
  Item item;
  WidgetCardItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<WidgetCardItem> createState() => _WidgetCardItemState();
}

class _WidgetCardItemState extends State<WidgetCardItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * .12,
                minHeight: MediaQuery.of(context).size.height * .10),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(246, 246, 246, 1),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(46, 46, 46, 0.35),
                      spreadRadius: 8,
                      blurRadius: 8)
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Image border
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(50), // Image radius
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                '${widget.item.gambar}',
                              ),
                              fit: BoxFit.scaleDown)),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${widget.item.nama}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text('Rp ${widget.item.harga}'),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (widget.item.jumlah >= 1) widget.item.jumlah--;
                        if (Provider.of<ListMenuProvider>(context,
                                    listen: false)
                                .totalHarga >=
                            0) {
                          Provider.of<ListMenuProvider>(context, listen: false)
                              .totalHargaMin(widget.item.harga);
                        }
                        print(
                            'Jumlah: ${widget.item.nama} | ${widget.item.jumlah}');
                        setState(() {
                          widget.item.jumlah;
                        });
                      },
                      icon: const Icon(Icons.remove),
                      color: const Color.fromRGBO(0, 154, 173, 1),
                    ),
                    Text('${widget.item.jumlah}'),
                    IconButton(
                        onPressed: () {
                          widget.item.jumlah++;
                          Provider.of<ListMenuProvider>(context, listen: false)
                              .totalHargaAdd(widget.item.harga)
                              .then((value) => setState(() {
                                    widget.item.jumlah;
                                  }))
                              .then((value) => Provider.of<ListMenuProvider>(
                                      context,
                                      listen: false)
                                  .setVoucher(Provider.of<ListMenuProvider>(
                                          context,
                                          listen: false)
                                      .controllerVoucher
                                      .text));
                          print(
                              'Jumlah: ${widget.item.nama} | ${widget.item.jumlah}');
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Color.fromRGBO(0, 154, 173, 1),
                        )),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
