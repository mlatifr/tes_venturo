// ignore: must_be_immutable
import 'package:flutter/material.dart';

class WidgetTittleCard extends StatelessWidget {
  String? tittle;
  var icon;
  WidgetTittleCard({Key? key, this.tittle, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              const Icon(
                Icons.fastfood_rounded,
                color: Color.fromRGBO(0, 154, 173, 1),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                tittle!,
                style: const TextStyle(
                  color: Color.fromRGBO(0, 154, 173, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          )),
    );
  }
}