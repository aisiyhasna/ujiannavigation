import 'package:flutter/material.dart';
import 'package:ujianbuamal/katalog.dart';
import 'package:ujianbuamal/profilepage.dart';
// Halaman utama: AppBar + isi + BottomNavigationBar
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0; // 0 = Katalog, 1 = Profil

  final List<Widget> _isi = [
    const KatalogPage(),
    const ProfilPage(),
  ];

  final List<String> _judul = [
    'TechExpress - Katalog',
    'TechExpress - Profil',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_judul[_index]),
        centerTitle: true,
      ),
      body: _isi[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) {
          setState(() {
            _index = i;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Katalog'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}