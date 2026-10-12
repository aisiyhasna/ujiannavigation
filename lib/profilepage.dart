import 'package:flutter/material.dart';

// ================= ISI PROFIL =================
// AppBar "TechExpress - Profil" sudah diatur di MainPage
class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SizedBox(height: 20),
          // [Icon]
          const Icon(Icons.account_circle, size: 100, color: Colors.blue),
          const SizedBox(height: 20),
          // Kode Member: [KODE_MEMBER]
          const Text(
            'Kode Member: TX-001', // ganti sesuai kode membermu
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 8),
          // NAMA (sesuaikan)
          const Text(
            'Aisyiah Hasna', // ganti dengan namamu
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          // Tombol logout
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Pindah ke login dan hapus semua halaman sebelumnya
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                  (route) => false,
                );
              },
              child: const Text('Logout'),
            ),
          ),
        ],
      ),
    );
  }
}