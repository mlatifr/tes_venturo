import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/order.dart';
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
            color: const Color.fromRGBO(223, 223, 223, 1),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Image border
                  child: SizedBox.fromSize(
                      size: const Size.fromRadius(50), // Image radius
                      child: Image.asset("assets/images/${widget.item.gambar}")
                      //  Image.network(
                      //     'https://www.piknikdong.com/wp-content/uploads/2020/11/Resep-Chicken-Katsu.jpg',
                      //     fit: BoxFit.cover),
                      ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${widget.item.nama}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text('Rp ${widget.item.harga}'),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (widget.item.jumlah >= 1) widget.item.jumlah--;

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
                              .totalHargaAdd(widget.item.harga);
                          print(
                              'Jumlah: ${widget.item.nama} | ${widget.item.jumlah}');
                          setState(() {
                            widget.item.jumlah;
                          });
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
