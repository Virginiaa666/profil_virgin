import 'package:flutter/material.dart';

void main() {
  runApp(const ProfilSayaApp());
}

class ProfilSayaApp extends StatelessWidget {
  const ProfilSayaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profil Saya',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProfilPage(),
    );
  }
}

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 60,
                child: Icon(
                  Icons.person,
                  size: 70,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Maria Virginia Siki',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                '202463121014',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Mahasiswa Teknik Komputer',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: const [
                      ListTile(
                        leading: Icon(Icons.school),
                        title: Text('Universitas Warmadewa'),
                      ),
                      ListTile(
                        leading: Icon(Icons.code),
                        title: Text('Flutter Developer'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}