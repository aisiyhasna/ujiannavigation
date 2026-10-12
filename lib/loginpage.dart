import 'package:flutter/material.dart';

// AppBar: Login [NAMA]
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasna'), // ganti [NAMA] dengan namamu
        centerTitle: true,
        leading: const Icon(Icons.login),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.rocket_launch, size: 100, color: Colors.blue),
              const SizedBox(height: 20),
              const Text(
                'Selamat Datang di techExpress',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // ganti halaman login -> home
                  Navigator.pushReplacementNamed(context, '/home');
                },
                child: const Text('Masuk ke Aplikasi'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}