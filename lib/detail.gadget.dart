import 'package:flutter/material.dart';
import 'package:ujianbuamal/halamanvoucher.dart';
import 'gadget.dart';

// [Icon Produk]
// Nama: Gadget [NAMA]
// Harga: Rp [HARGA]  <- harga berubah setelah di klaim
// Voucher: [Voucher Terpilih/-]
// [ Klaim Voucher Diskon ]
class DetailPage extends StatefulWidget {
  final Gadget gadget;

  const DetailPage({super.key, required this.gadget});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String? _voucher; // null = belum memilih voucher

  // Harga dihitung dari voucher yang terpilih.
  // Angka persen diambil dari teks voucher, misal 'Diskon 10%' -> 10
  int get _harga {
    final hargaAsli = widget.gadget.harga;
    if (_voucher == null) return hargaAsli;

    final cocok = RegExp(r'\d+').firstMatch(_voucher!);
    if (cocok == null) return hargaAsli;

    final persen = int.parse(cocok.group(0)!);
    return hargaAsli - (hargaAsli * persen ~/ 100);
  }

  Future<void> _klaimVoucher() async {
    // buka halaman voucher & tunggu hasil pop-nya
    final hasil = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const VoucherPage()),
    );

    if (!mounted) return;

    // kalau user memilih voucher, simpan -> harga ikut berubah
    if (hasil != null) {
      setState(() {
        _voucher = hasil as String;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final gadget = widget.gadget;

    return Scaffold(
      // tombol back otomatis (pop)
      appBar: AppBar(
        title: Text('Detail ${gadget.nama}'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(gadget.icon, size: 100, color: Colors.blue),
            ),
            const SizedBox(height: 24),
            Text('Nama: Gadget ${gadget.nama}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            // pakai _harga (bukan gadget.harga) supaya berubah setelah klaim
            Text('Harga: Rp $_harga', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Voucher: ${_voucher ?? '-'}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: _klaimVoucher,
                child: const Text('Klaim Voucher Diskon'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}