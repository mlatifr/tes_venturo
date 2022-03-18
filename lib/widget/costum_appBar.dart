import 'package:flutter/material.dart';

class costumAppBar extends StatelessWidget implements PreferredSizeWidget {
  String tittle;
  var icon;
  bool isLeading;
  costumAppBar(
      {Key? key,
      required this.tittle,
      required this.icon,
      required this.isLeading})
      : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: !isLeading
          ? null
          : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      // leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.room_service_rounded,
            color: Color.fromRGBO(0, 154, 173, 1),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            tittle,
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      actions: const [],
    );
  }
}
