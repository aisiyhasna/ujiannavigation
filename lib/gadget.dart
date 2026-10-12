import 'package:flutter/material.dart';

// Data satu gadget
class Gadget {
  final IconData icon;
  final String nama;
  final int harga;

  Gadget({required this.icon, required this.nama, required this.harga});
}

// Daftar gadget yang tampil di katalog (boleh diganti)
final List<Gadget> daftarGadget = [
  Gadget(icon: Icons.smartphone, nama: 'Smartphone', harga: 3500000),
  Gadget(icon: Icons.laptop, nama: 'Laptop', harga: 8000000),
  Gadget(icon: Icons.headphones, nama: 'Headphone', harga: 500000),
  Gadget(icon: Icons.watch, nama: 'Smartwatch', harga: 1200000),
  Gadget(icon: Icons.tablet_mac, nama: 'Tablet', harga: 4500000),
];