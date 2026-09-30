String hurufMutu(double nilai) {
  if (nilai < 0 || nilai > 100) {
    throw ArgumentError("Nilai harus antara 0 sampai 100");
  }

  if (nilai >= 80) {
    return "A";
  } else if (nilai >= 70) {
    return "B";
  } else if (nilai >= 60) {
    return "C";
  } else if (nilai >= 50) {
    return "D";
  } else {
    return "E";
  }
}

void main() {
  List<double> nilai = [
    95,
    88,
    76,
    65,
    55,
    45,
    35,
    72,
    81,
    100
  ];

  for (double n in nilai) {
    print("Nilai $n = ${hurufMutu(n)}");
  }
}