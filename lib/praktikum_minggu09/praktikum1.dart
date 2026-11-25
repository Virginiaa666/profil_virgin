
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Praktikum1 extends StatefulWidget {
  const Praktikum1({super.key});

  @override
  State<Praktikum1> createState() => _Praktikum1State();
}

class _Praktikum1State extends State<Praktikum1> {
  final ImagePicker picker = ImagePicker();
  File? fotoProfil;

  Future<void> ambilFoto(ImageSource sumber) async {
    // Kamera belum didukung image_picker di Windows
    if (Platform.isWindows && sumber == ImageSource.camera) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Fitur kamera belum didukung pada Windows.',
          ),
        ),
      );
      return;
    }

    try {
      final XFile? hasil = await picker.pickImage(
        source: sumber,
      );

      if (hasil != null) {
        setState(() {
          fotoProfil = File(hasil.path);
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal memilih foto: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Foto Profil'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 75,
              backgroundImage: fotoProfil != null
                  ? FileImage(fotoProfil!)
                  : null,
              child: fotoProfil == null
                  ? const Icon(Icons.person, size: 80)
                  : null,
            ),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: () {
                ambilFoto(ImageSource.camera);
              },
              icon: const Icon(Icons.camera_alt),
              label: const Text('Ambil dari Kamera'),
            ),

            ElevatedButton.icon(
              onPressed: () {
                ambilFoto(ImageSource.gallery);
              },
              icon: const Icon(Icons.photo),
              label: const Text('Pilih dari Galeri'),
            ),
          ],
        ),
      ),
    );
  }
}
