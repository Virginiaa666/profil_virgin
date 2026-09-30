class Mahasiswa {
  String nama;
  double nilai;

  Mahasiswa(this.nama, this.nilai);
}

void main() {
  List<Mahasiswa> mahasiswa = [
    Mahasiswa("Made Oka", 90),
    Mahasiswa("Rain", 78),
    Mahasiswa("Elvrida", 85),
    Mahasiswa("Ferry", 88),
    Mahasiswa("Yosni", 82),
    Mahasiswa("Nia", 75),
    Mahasiswa("Okta", 92),
    Mahasiswa("Virginia", 87),
    Mahasiswa("Leksi", 80),
  ];

  // Nama Leksi dibuat mengulang
  mahasiswa.add(Mahasiswa("Leksi", 84));

  print("=== DATA NILAI MAHASISWA ===");

  for (var m in mahasiswa) {
    print("${m.nama} : ${m.nilai}");
  }

  // Menghitung rata-rata
  double total = 0;

  for (var m in mahasiswa) {
    total += m.nilai;
  }

  double rataRata = total / mahasiswa.length;

  // Mencari nilai tertinggi dan terendah
  double nilaiTertinggi = mahasiswa[0].nilai;
  double nilaiTerendah = mahasiswa[0].nilai;

  for (var m in mahasiswa) {
    if (m.nilai > nilaiTertinggi) {
      nilaiTertinggi = m.nilai;
    }

    if (m.nilai < nilaiTerendah) {
      nilaiTerendah = m.nilai;
    }
  }

  // Mencari nama yang mengulang
  Map<String, int> jumlahNama = {};

  for (var m in mahasiswa) {
    jumlahNama[m.nama] = (jumlahNama[m.nama] ?? 0) + 1;
  }

  List<String> namaMengulang = jumlahNama.entries
      .where((entry) => entry.value > 1)
      .map((entry) => entry.key)
      .toList();

  // Mengurutkan nama yang mengulang
  namaMengulang.sort();

  print("\n=== HASIL STATISTIK ===");
  print("Rata-rata nilai: ${rataRata.toStringAsFixed(2)}");
  print("Nilai tertinggi: $nilaiTertinggi");
  print("Nilai terendah: $nilaiTerendah");
  print("Nama yang mengulang: $namaMengulang");
}