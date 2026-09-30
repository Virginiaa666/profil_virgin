import 'dart:io';

void main() {
  // Data mata kuliah
  List<Map<String, dynamic>> mataKuliah = [
    {
      "nama": "Pemrograman Mobile",
      "sks": 3,
      "semester": 5,
    },
    {
      "nama": "Deep Learning",
      "sks": 3,
      "semester": 5,
    },
    {
      "nama": "Computer Vision",
      "sks": 3,
      "semester": 5,
    },
    {
      "nama": "Natural Language Processing",
      "sks": 3,
      "semester": 5,
    },
    {
      "nama": "Keamanan Aplikasi dan Jaringan",
      "sks": 3,
      "semester": 5,
    },
    {
      "nama": "Keamanan Siber",
      "sks": 3,
      "semester": 5,
    },
    {
      "nama": "Teknologi Big Data",
      "sks": 3,
      "semester": 5,
    },
  ];

  // Menampilkan semua data
  print("==============================================");
  print("           DATA MATA KULIAH");
  print("==============================================");

  mataKuliah.forEach((mk) {
    print(
      "${mk["nama"]} | ${mk["sks"]} SKS | Semester ${mk["semester"]}",
    );
  });

  // ============================================
  // 1. PENCARIAN BERDASARKAN KATA KUNCI
  // ============================================

  stdout.write("\nMasukkan kata kunci pencarian: ");
  String kataKunci = stdin.readLineSync() ?? "";

  var hasilPencarian = mataKuliah.where((mk) {
    return mk["nama"]
        .toString()
        .toLowerCase()
        .contains(kataKunci.toLowerCase());
  }).toList();

  print("\n==============================================");
  print("             HASIL PENCARIAN");
  print("==============================================");

  if (hasilPencarian.isEmpty) {
    print("Mata kuliah tidak ditemukan.");
  } else {
    hasilPencarian.forEach((mk) {
      print(
        "${mk["nama"]} | ${mk["sks"]} SKS | Semester ${mk["semester"]}",
      );
    });
  }

  // ============================================
  // 2. PENYARINGAN BERDASARKAN SKS
  // ============================================

  stdout.write("\nMasukkan jumlah SKS yang ingin difilter: ");
  int sks = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

  var hasilFilter = mataKuliah
      .where((mk) => mk["sks"] == sks)
      .toList();

  print("\n==============================================");
  print("          MATA KULIAH $sks SKS");
  print("==============================================");

  if (hasilFilter.isEmpty) {
    print("Tidak ada mata kuliah dengan $sks SKS.");
  } else {
    hasilFilter.forEach((mk) {
      print(
        "${mk["nama"]} | ${mk["sks"]} SKS | Semester ${mk["semester"]}",
      );
    });
  }

  // ============================================
  // 3. PENGURUTAN BERDASARKAN NAMA
  // ============================================

  var dataUrut = List<Map<String, dynamic>>.from(mataKuliah);

  dataUrut.sort(
    (a, b) => a["nama"].toString().compareTo(
          b["nama"].toString(),
        ),
  );

  print("\n==============================================");
  print("       DATA DIURUTKAN BERDASARKAN NAMA");
  print("==============================================");

  dataUrut.forEach((mk) {
    print(
      "${mk["nama"]} | ${mk["sks"]} SKS | Semester ${mk["semester"]}",
    );
  });

  print("\n==============================================");
  print("              PROGRAM SELESAI");
  print("==============================================");
}