// 1. Urutkan angka dari kecil ke besar
List<int> sortAscending(List<int> data) => [...data]..sort();

// 2. Deret Fibonacci ke-n
int fibonacci(int n) {
  if (n <= 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

// 3. Cek apakah sebuah bilangan adalah bilangan prima
bool isPrime(int n) {
  if (n < 2) return false;
  for (int i = 2; i <= n ~/ 2; i++) {
    if (n % i == 0) return false;
  }
  return true;
}

// 4. Hitung faktorial dari angka n
int factorial(int n) => n == 0 ? 1 : n * factorial(n - 1);

// 5. Jumlahkan semua angka di dalam list
int sumList(List<int> data) => data.reduce((a, b) => a + b);

// 6. Cek apakah string merupakan palindrome (kata yang dibalik sama)
bool isPalindrome(String s) {
  String clean = s.toLowerCase().replaceAll(' ', '');
  return clean == clean.split('').reversed.join();
}

// 7. Hitung jumlah huruf vokal (a, i, u, e, o) dalam string
int countVowels(String s) {
  final vowels = ['a', 'i', 'u', 'e', 'o'];
  return s.toLowerCase().split('').where((c) => vowels.contains(c)).length;
}

// 8. Balikkan string (reverse)
String reverse(String s) => s.split('').reversed.join();

// 9. Ubah huruf pertama menjadi kapital, sisanya kecil
String capitalize(String s) =>
    s[0].toUpperCase() + s.substring(1).toLowerCase();

// 10. Hitung berapa kali karakter tertentu muncul dalam string
int countChar(String s, String char) {
  return s.split('').where((c) => c == char).length;
}

// 11. Cari angka terbesar dari list
int maxInList(List<int> data) => data.reduce((a, b) => a > b ? a : b);

// 12. Ambil hanya angka genap dari list
List<int> filterEven(List<int> data) => data.where((n) => n % 2 == 0).toList();

// 13. Hitung berapa banyak angka yang muncul lebih dari satu kali
int countDuplicates(List<int> data) {
  final map = <int, int>{};
  for (var n in data) {
    map[n] = (map[n] ?? 0) + 1;
  }
  return map.values.where((v) => v > 1).length;
}

// 14. Balikkan isi list
List<T> reverseList<T>(List<T> input) => input.reversed.toList();

// 15. Gabungkan dua list dan hilangkan angka yang duplikat
List<int> mergeUnique(List<int> a, List<int> b) => {...a, ...b}.toList();

// 16. Buat fungsi yang menerima angka n dan mengembalikan nilai deret Fibonacci ke-n.
int fibonaccis(int n) {
  if (n <= 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}
void main() {
  print(sortAscending([5, 1, 3])); // [1, 3, 5]
  print(fibonacci(7)); // 13
  print(isPrime(11)); // true
  print(factorial(5)); // 120
  print(sumList([1, 2, 3, 4])); // 10
  print(isPalindrome("katak")); // true
  print(countVowels("Halo Dunia")); // 5
  print(reverse("flutter")); // rettulf
  print(capitalize("flutter")); // Flutter
  print(countChar("banana", "a")); // 3
  print(maxInList([1, 9, 4, 2])); // 9
  print(filterEven([1, 2, 3, 4, 5])); // [2, 4]
  print(countDuplicates([1, 2, 2, 3, 3, 3])); // 2
  print(reverseList(["a", "b", "c"])); // [c, b, a]
  print(mergeUnique([1, 2, 3], [2, 3, 4])); // [1, 2, 3, 4]
  print(fibonaccis(10));
}
