
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Praktikum2 extends StatefulWidget {
  const Praktikum2({super.key});

  @override
  State<Praktikum2> createState() => _Praktikum2State();
}

class _Praktikum2State extends State<Praktikum2>
    with WidgetsBindingObserver {
  CameraController? _controller;

  List<CameraDescription> _kamera = [];
  List<File> _fotoTerakhir = [];

  String? _pesanError;
  int _kameraAktif = 0;
  bool _sedangMenyiapkan = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _siapkanKamera();
  }

  Future<void> _siapkanKamera() async {
    if (_sedangMenyiapkan) return;

    _sedangMenyiapkan = true;

    try {
      
try {
  _kamera = await availableCameras();

  print('Jumlah kamera: ${_kamera.length}');

  for (var kamera in _kamera) {
    print('Nama kamera: ${kamera.name}');
  }

  if (_kamera.isEmpty) {
    throw Exception('Kamera tidak ditemukan.');
  }


      if (_kamera.isEmpty) {
        throw Exception('Kamera tidak ditemukan.');
      }

      if (_kameraAktif >= _kamera.length) {
        _kameraAktif = 0;
      }

      final controller = CameraController(
        _kamera[_kameraAktif],
        ResolutionPreset.medium,
        enableAudio: false,
      );

      await controller.initialize();

      if (!mounted) {
        await controller.dispose();
        return;
      }

      setState(() {
        _controller = controller;
        _pesanError = null;
      });
    } catch (e) {
      if (mounted) {
        setState(() {
          _pesanError = 'Kamera gagal dibuka: $e';
        });
      }
    } finally {
      _sedangMenyiapkan = false;
    }
  }

  Future<void> _ambilFoto() async {
    final controller = _controller;

    if (controller == null ||
        !controller.value.isInitialized ||
        controller.value.isTakingPicture) {
      return;
    }

    try {
      final hasil = await controller.takePicture();

      if (!mounted) return;

      setState(() {
        _fotoTerakhir.insert(0, File(hasil.path));

        if (_fotoTerakhir.length > 3) {
          _fotoTerakhir.removeLast();
        }
      });
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal mengambil foto: $e')),
      );
    }
  }

  Future<void> _gantiKamera() async {
    if (_kamera.length < 2) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Hanya satu kamera yang tersedia.'),
        ),
      );
      return;
    }

    final controller = _controller;

    setState(() {
      _controller = null;
    });

    await controller?.dispose();

    _kameraAktif = (_kameraAktif + 1) % _kamera.length;

    await _siapkanKamera();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) {
      final controller = _controller;
      _controller = null;
      controller?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _siapkanKamera();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = _controller;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Praktikum 2 - Kamera'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.black,
              width: double.infinity,
              child: _pesanError != null
                  ? Center(
                      child: Text(
                        _pesanError!,
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : controller == null ||
                          !controller.value.isInitialized
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : CameraPreview(controller),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: _gantiKamera,
                  icon: const Icon(Icons.flip_camera_android),
                  label: const Text('Ganti Kamera'),
                ),

                FloatingActionButton(
                  onPressed: _ambilFoto,
                  child: const Icon(Icons.camera_alt),
                ),
              ],
            ),
          ),

          const Text(
            'Tiga Foto Terakhir',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(
            height: 110,
            child: _fotoTerakhir.isEmpty
                ? const Center(
                    child: Text('Belum ada foto'),
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _fotoTerakhir.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Image.file(
                          _fotoTerakhir[index],
                          width: 85,
                          height: 85,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
