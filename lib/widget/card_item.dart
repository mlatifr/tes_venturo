import 'package:flutter/material.dart';

import '../model/item.dart';

class WidgetCardItem extends StatelessWidget {
  Item item;
  WidgetCardItem({Key? key, required this.item}) : super(key: key);

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
                    child: Image.network(
                        'https://www.piknikdong.com/wp-content/uploads/2020/11/Resep-Chicken-Katsu.jpg',
                        fit: BoxFit.cover),
                  ),
                ),
                //konten
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${item.nama}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text('Rp ${item.harga}'),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.remove),
                      color: const Color.fromRGBO(0, 154, 173, 1),
                    ),
                    const Text('1'),
                    IconButton(
                        onPressed: () {},
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
