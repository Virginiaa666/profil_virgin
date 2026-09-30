import 'dart:io';

void main() {
  String usernameBenar = "mahasiswa";
  String passwordBenar = "12345";

  int percobaan = 0;

  do {
    percobaan++;

    print("\n=== SIMULASI LOGIN ===");

    stdout.write("Masukkan username: ");
    String username = stdin.readLineSync() ?? "";

    stdout.write("Masukkan password: ");
    String password = stdin.readLineSync() ?? "";

    if (username == usernameBenar && password == passwordBenar) {
      print("Login berhasil!");
      break;
    } else {
      print("Username atau password salah.");

      if (percobaan == 3) {
        print("Percobaan ke-3 gagal.");
        print("Akun terkunci!");
      } else {
        print("Sisa kesempatan: ${3 - percobaan}");
      }
    }
  } while (percobaan < 3);
}