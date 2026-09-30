// Higher-order function
List<int> filterData(
    List<int> data, bool Function(int) kriteria) {
  return data.where(kriteria).toList();
}

void main() {
  List<int> data = [2, 5, 8, 10, 13, 15, 18, 20, 23, 25];

  print("=== DATA AWAL ===");
  print(data);

  // Kriteria 1: mencari angka lebih dari 10
  List<int> lebihDari10 =
      filterData(data, (nilai) => nilai > 10);

  // Kriteria 2: mencari angka genap
  List<int> angkaGenap =
      filterData(data, (nilai) => nilai % 2 == 0);

  // Kriteria 3: mencari angka kelipatan 5
  List<int> kelipatan5 =
      filterData(data, (nilai) => nilai % 5 == 0);

  print("\n=== HASIL FILTER ===");
  print("Angka lebih dari 10 : $lebihDari10");
  print("Angka genap          : $angkaGenap");
  print("Kelipatan 5          : $kelipatan5");

  // Versi menggunakan perulangan biasa
  List<int> hasilLoop = [];

  for (var nilai in data) {
    if (nilai > 10) {
      hasilLoop.add(nilai);
    }
  }

  print("\n=== VERSI PERULANGAN BIASA ===");
  print("Angka lebih dari 10 : $hasilLoop");

  print("\n=== PERBANDINGAN ===");
  print("Higher-order function lebih singkat dan dapat");
  print("digunakan kembali dengan kriteria yang berbeda.");
}