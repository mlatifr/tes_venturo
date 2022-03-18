import 'dart:convert';

class Item {
  var id, nama, harga, tipe, gambar, created_at, updated_at, jumlah;

  Item(
      {required this.id,
      required this.nama,
      required this.harga,
      required this.tipe,
      required this.gambar,
      required this.created_at,
      required this.updated_at,
      this.jumlah});
  factory Item.fromJson(Map<String, dynamic> json) => Item(
      id: json['id'],
      nama: json['nama'],
      harga: json['harga'],
      tipe: json['tipe'],
      gambar: json['gambar'],
      created_at: json['created_at'],
      updated_at: json['updated_at']);
}
