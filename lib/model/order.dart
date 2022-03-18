import 'dart:convert';

class Order {
  var id, nama, harga, tipe, gambar, created_at, updated_at;
  num jumlah = 0;

  Order(
      {required this.id,
      required this.nama,
      required this.harga,
      required this.tipe,
      required this.gambar,
      required this.created_at,
      required this.updated_at,
      required this.jumlah});
}
