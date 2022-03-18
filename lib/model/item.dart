import 'dart:convert';

class Item {
  final id, nama, harga, tipe, gambar, created_at, updated_at;

  Item(
      {required this.id,
      required this.nama,
      required this.harga,
      required this.tipe,
      required this.gambar,
      required this.created_at,
      required this.updated_at});
  factory Item.fromJson(Map<String, dynamic> json) => Item(
      id: json['id'],
      nama: json['nama'],
      harga: json['harga'],
      tipe: json['tipe'],
      gambar: json['gambar'],
      created_at: json['created_at'],
      updated_at: json['updated_at']);
}
