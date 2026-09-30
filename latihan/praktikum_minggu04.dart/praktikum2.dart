import 'dart:io';

void main() {
  Map<String, int> inventaris = {
    "Buku": 10,
    "Pulpen": 3,
    "Pensil": 7,
    "Penghapus": 2,
    "Penggaris": 5,
  };

  bool berjalan = true;

  while (berjalan) {
    print("\n=== MAP INVENTARIS ===");
    print("1. Lihat semua barang");
    print("2. Tambah barang");
    print("3. Ubah stok barang");
    print("4. Hapus barang");
    print("5. Lihat stok di bawah 5");
    print("6. Keluar");

    stdout.write("Pilih menu: ");
    String pilihan = stdin.readLineSync() ?? "";

    switch (pilihan) {
      case "1":
        print("\n=== DAFTAR BARANG ===");

        inventaris.forEach((barang, stok) {
          print("$barang : $stok");
        });
        break;

      case "2":
        stdout.write("\nMasukkan nama barang: ");
        String namaBarang = stdin.readLineSync() ?? "";

        stdout.write("Masukkan jumlah stok: ");
        int stok = int.parse(stdin.readLineSync() ?? "0");

        inventaris[namaBarang] = stok;

        print("$namaBarang berhasil ditambahkan.");
        break;

      case "3":
        stdout.write("\nMasukkan nama barang yang ingin diubah: ");
        String namaBarang = stdin.readLineSync() ?? "";

        if (inventaris.containsKey(namaBarang)) {
          stdout.write("Masukkan stok baru: ");
          int stokBaru = int.parse(stdin.readLineSync() ?? "0");

          inventaris[namaBarang] = stokBaru;

          print("Stok $namaBarang berhasil diubah.");
        } else {
          print("Barang tidak ditemukan.");
        }
        break;

      case "4":
        stdout.write("\nMasukkan nama barang yang ingin dihapus: ");
        String namaBarang = stdin.readLineSync() ?? "";

        if (inventaris.containsKey(namaBarang)) {
          inventaris.remove(namaBarang);

          print("$namaBarang berhasil dihapus.");
        } else {
          print("Barang tidak ditemukan.");
        }
        break;

      case "5":
        print("\n=== STOK DI BAWAH 5 ===");

        var stokSedikit =
            inventaris.entries.where((entry) => entry.value < 5);

        for (var item in stokSedikit) {
          print("${item.key} : ${item.value}");
        }
        break;

      case "6":
        berjalan = false;
        print("\nProgram selesai.");
        break;

      default:
        print("\nPilihan tidak tersedia.");
    }
  }
}