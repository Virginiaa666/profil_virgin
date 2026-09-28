// latihan/minggu-02/latihan_dart_minggu_02.dart

// ==========================================================
// 1. KONVERSI SUHU
// ==========================================================

// Function untuk mengubah Celsius ke Fahrenheit.
double celsiusToFahrenheit(double celsius) {
  return (celsius * 9 / 5) + 32;
}

// Function untuk mengubah Celsius ke Kelvin.
double celsiusToKelvin(double celsius) {
  return celsius + 273.15;
}

// ==========================================================
// 2. CLASS PRODUK
// ==========================================================

class Produk {
  // final digunakan karena nilai nama dan harga tidak diubah
  // setelah objek Produk dibuat.
  final String nama;
  final double harga;

  // Diskon dibuat nullable (?) karena diskon bersifat opsional.
  // Jika tidak diberikan, nilainya dianggap 0%.
  final double? diskon;

  Produk({
    required this.nama,
    required this.harga,
    this.diskon,
  });

  // Menghitung harga akhir setelah diskon.
  double hargaAkhir() {
    final double persenDiskon = diskon ?? 0;
    return harga - (harga * persenDiskon / 100);
  }
}

// ==========================================================
// 3. DEMONSTRASI var, final, const, DAN late
// ==========================================================

void demonstrasiVariabel() {
  // var digunakan ketika tipe data dapat disimpulkan oleh Dart.
  var namaMahasiswa = 'Virginia';

  // final digunakan untuk nilai yang ditentukan saat program
  // berjalan dan tidak dapat diubah lagi.
  final waktuPengerjaan = DateTime.now();

  // const digunakan untuk nilai konstan yang sudah diketahui
  // saat program dikompilasi.
  const mataKuliah = 'Pemrograman Mobile';

  // late digunakan untuk variabel yang akan diberi nilai
  // nanti, tetapi sebelum digunakan.
  late String statusTugas;
  statusTugas = 'Selesai';

  print('\n=== DEMONSTRASI var, final, const, dan late ===');
  print('Nama        : $namaMahasiswa');
  print('Waktu       : $waktuPengerjaan');
  print('Mata Kuliah : $mataKuliah');
  print('Status      : $statusTugas');
}

// ==========================================================
// MAIN PROGRAM
// ==========================================================

void main() {
  // --------------------------------------------------------
  // Contoh 1: Konversi suhu
  // --------------------------------------------------------
  const double celsius = 25;

  final double fahrenheit = celsiusToFahrenheit(celsius);
  final double kelvin = celsiusToKelvin(celsius);

  print('=== KONVERSI SUHU ===');
  print('Suhu Celsius   : $celsius °C');
  print('Fahrenheit     : ${fahrenheit.toStringAsFixed(2)} °F');
  print('Kelvin         : ${kelvin.toStringAsFixed(2)} K');

  // --------------------------------------------------------
  // Contoh 2: Class Produk
  // --------------------------------------------------------
  final produk1 = Produk(
    nama: 'Laptop',
    harga: 8000000,
    diskon: 10,
  );

  final produk2 = Produk(
    nama: 'Mouse',
    harga: 200000,
    // Diskon tidak diberikan karena bersifat opsional.
  );

  print('\n=== DATA PRODUK ===');
  print('Produk 1       : ${produk1.nama}');
  print('Harga awal     : Rp${produk1.harga.toStringAsFixed(0)}');
  print('Diskon         : ${produk1.diskon ?? 0}%');
  print('Harga akhir    : Rp${produk1.hargaAkhir().toStringAsFixed(0)}');

  print('\nProduk 2       : ${produk2.nama}');
  print('Harga awal     : Rp${produk2.harga.toStringAsFixed(0)}');
  print('Diskon         : ${produk2.diskon ?? 0}%');
  print('Harga akhir    : Rp${produk2.hargaAkhir().toStringAsFixed(0)}');

  // --------------------------------------------------------
  // Contoh 3: var, final, const, dan late
  // --------------------------------------------------------
  demonstrasiVariabel();
}
