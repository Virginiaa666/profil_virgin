
import 'package:flutter/material.dart';

enum StatusData {
  loading,
  success,
  empty,
  error,
}

class Praktikum3 extends StatefulWidget {
  const Praktikum3({super.key});

  @override
  State<Praktikum3> createState() => _Praktikum3State();
}

class _Praktikum3State extends State<Praktikum3> {
  StatusData _status = StatusData.loading;
  List<String> _data = [];
  String _pesanError = '';
  String _modeTerakhir = 'data';

  @override
  void initState() {
    super.initState();
    _muatData('data');
  }

  Future<void> _muatData(String mode) async {
    setState(() {
      _status = StatusData.loading;
      _modeTerakhir = mode;
    });

    try {
      await Future.delayed(const Duration(seconds: 2));

      if (mode == 'error') {
        throw Exception('Gagal mengambil data.');
      }

      if (!mounted) return;

      setState(() {
        if (mode == 'kosong') {
          _data = [];
          _status = StatusData.empty;
        } else {
          _data = [
            'Belajar Flutter',
            'Memahami Async dan Await',
            'Operasi Asynchronous',
          ];
          _status = StatusData.success;
        }
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _pesanError = e.toString();
        _status = StatusData.error;
      });
    }
  }

  Widget _tampilanData() {
    switch (_status) {
      case StatusData.loading:
        return const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Sedang memuat data...'),
          ],
        );

      case StatusData.success:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle,
                color: Colors.green, size: 60),
            const SizedBox(height: 12),
            const Text(
              'Data berhasil dimuat!',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ..._data.map(
              (item) => Card(
                child: ListTile(
                  leading: const Icon(Icons.book),
                  title: Text(item),
                ),
              ),
            ),
          ],
        );

      case StatusData.empty:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.inbox,
                size: 60, color: Colors.orange),
            const SizedBox(height: 12),
            const Text(
              'Data masih kosong.',
              style: TextStyle(fontSize: 18),
            ),
            const Text('Silakan coba memuat data kembali.'),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => _muatData('data'),
              child: const Text('Muat Ulang'),
            ),
          ],
        );

      case StatusData.error:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error,
                size: 60, color: Colors.red),
            const SizedBox(height: 12),
            const Text(
              'Terjadi Kesalahan!',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(_pesanError),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () => _muatData(_modeTerakhir),
              icon: const Icon(Icons.refresh),
              label: const Text('Coba Lagi'),
            ),
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Praktikum 3 - Operasi Paralel'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Halaman dengan Empat Kondisi',
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(child: _tampilanData()),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Pilih Kondisi untuk Pengujian:',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _muatData('data'),
                child: const Text('Uji Berhasil dengan Data'),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _muatData('kosong'),
                child: const Text('Uji Berhasil tetapi Kosong'),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _muatData('error'),
                child: const Text('Uji Kondisi Gagal'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
