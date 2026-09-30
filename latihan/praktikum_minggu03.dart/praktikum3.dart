void main() {
  print("=== BILANGAN 1 SAMPAI 50 ===");

  for (int i = 1; i <= 50; i++) {
    if (i % 3 == 0) {
      continue;
    }

    print(i);
  }
}