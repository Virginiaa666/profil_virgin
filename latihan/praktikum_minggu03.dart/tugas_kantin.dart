import 'dart:io';

void main() {
  double total = 0;
  bool selesai = false;

  print("=== APLIKASI KONSOL MENU KANTIN ===");

  while (!selesai) {
    print("\nMenu Kantin:");
    print("1. Nasi Goreng  - Rp15.000");
    print("2. Mie Goreng    - Rp12.000");
    print("3. Ayam Geprek   - Rp18.000");
    print("4. Es Teh        - Rp5.000");
    print("5. Selesai");

    try {
      stdout.write("Pilih menu: ");
      int pilihan = int.parse(stdin.readLineSync()!);

      switch (pilihan) {
        case 1:
          total += 15000;
          print("Nasi Goreng ditambahkan.");
          break;

        case 2:
          total += 12000;
          print("Mie Goreng ditambahkan.");
          break;

        case 3:
          total += 18000;
          print("Ayam Geprek ditambahkan.");
          break;

        case 4:
          total += 5000;
          print("Es Teh ditambahkan.");
          break;

        case 5:
          selesai = true;
          print("Pesanan selesai.");
          break;

        default:
          print("Pilihan menu tidak tersedia.");
      }
    } catch (e) {
      print("Input tidak valid! Silakan masukkan angka.");
    }
  }

  print("\n=== STRUK PEMBELIAN ===");
  print("Total belanja: Rp${total.toStringAsFixed(0)}");
  print("Terima kasih sudah berbelanja!");
}