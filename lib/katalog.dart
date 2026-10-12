import 'package:flutter/material.dart';
import 'package:ujianbuamal/detail.gadget.dart';
import 'gadget.dart';

// Isi tab Katalog: [icon] Gadget [nama] Rp [harga]
class KatalogPage extends StatelessWidget {
  const KatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: daftarGadget.length,
      itemBuilder: (context, index) {
        final gadget = daftarGadget[index];

        // Card dibungkus GestureDetector
        return GestureDetector(
          onTap: () {
            // push ke DetailPage
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(gadget: gadget),
              ),
            );
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(gadget.icon, size: 40, color: Colors.blue),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Gadget ${gadget.nama}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text('Rp ${gadget.harga}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}