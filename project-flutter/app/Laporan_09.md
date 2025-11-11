# Laporan Jobsheet 09 - Kamera dan Photo Filter Carousel

**Nama:** Indira Nafa Aurah Huda  
**NIM:** 2341720001  
**Kelas:** TI-3E

## Tujuan
Mengimplementasikan pengambilan foto menggunakan plugin `camera` dan menambahkan photo filter carousel untuk memodifikasi foto yang diambil.

---

## Praktikum 1: Mengambil Foto dengan Kamera di Flutter

### Tujuan
Memahami cara mengakses kamera perangkat, menampilkan preview, mengambil foto, dan menyimpan/menampilkan hasilnya.

### Langkah singkat yang dilakukan
- Menambahkan dependensi: `camera`, `path_provider`, `path` pada `pubspec.yaml`.
- Menginisialisasi plugin kamera pada `main()` menggunakan `WidgetsFlutterBinding.ensureInitialized()` dan `availableCameras()`.
- Membuat `TakePictureScreen` (StatefulWidget) yang menginisialisasi `CameraController` pada `initState()` dan me-dispose pada `dispose()`.
- Menampilkan preview kamera menggunakan `CameraPreview` setelah `_controller.initialize()` selesai (pakai `FutureBuilder`).
- Mengambil foto dengan `_controller.takePicture()` dan menampilkan hasil pada `DisplayPictureScreen`.

### Hasil / Screenshot
Praktikum 1 — pengambilan foto (screenshot): `screenshot/JB09_1.png`

---

## Praktikum 2: Photo Filter Carousel

### Tujuan
Membuat carousel pilihan filter warna yang dapat diaplikasikan ke foto.

### Langkah singkat yang dilakukan
- Membuat widget `FilterItem`, `FilterSelector` (carousel), `CarouselFlowDelegate` (layout Flow) dan `PhotoFilterCarousel`.
- `PhotoFilterCarousel` menerima path file gambar (`imagePath`) dan menampilkan `Image.file(...)` dengan `color` dan `colorBlendMode` yang diatur sesuai filter terpilih.
- Menggabungkan alur: setelah pengguna mengambil foto, aplikasi membuka layar filter dan menampilkan foto yang baru diambil—pengguna dapat memilih filter dengan menggeser carousel.

### Hasil / Screenshot
Praktikum 2 — filter carousel (screenshot): `screenshot/JB09_2.png`

---

## Tugas Praktikum (JB09_3, JB09_4, JB09_5)

### Integrasi (Gabungan Praktikum 1 + 2)

- Alur aplikasi yang diimplementasikan:
  1. Aplikasi menginisialisasi kamera di `main()` dan menampilkan `TakePictureScreen` sebagai home.
  2. Pengguna menekan tombol kamera → gambar diambil dan disimpan sebagai file sementara (XFile).
  3. Setelah menampilkan preview hasil, jika `TakePictureScreen` adalah home, aplikasi membuka `PhotoFilterCarousel(imagePath: <path>)` sehingga pengguna langsung bisa memilih filter untuk foto tersebut.

### Hasil / Screenshot
Tugas Praktikum — filter carousel (screenshot): `screenshot/JB09_3.png`
`screenshot/JB09_4.png`
`screenshot/JB09_5.png`

### Jelaskan maksud `void async` pada praktikum 1

Penjelasan singkat:
- `Future<void> main() async { ... }` digunakan untuk menandai bahwa fungsi `main` bersifat asynchronous dan dapat menggunakan `await` di dalamnya.
- Pada praktikum ini kita perlu memanggil `await availableCameras()` sebelum memanggil `runApp(...)`. Karena `availableCameras()` mengembalikan `Future<List<CameraDescription>>`, kita harus menunggu hasilnya agar aplikasi memiliki daftar kamera yang tersedia sebelum membuat widget yang membutuhkan `CameraDescription`.
- Kata kunci `async` di-deklarasikan pada tanda fungsi dan `await` digunakan untuk menunggu penyelesaian operasi asynchronous. Tipe `Future<void>` menunjukkan fungsi tersebut menyelesaikan sebuah Future yang tidak mengembalikan nilai (void) pada akhirnya.

### Jelaskan fungsi dari anotasi `@immutable`

Penjelasan singkat:
- `@immutable` adalah anotasi (dari paket `meta`) yang digunakan untuk menandai bahwa sebuah kelas seharusnya bersifat immutable — semua field publiknya harus `final`.
- Di Flutter, biasanya digunakan pada `StatelessWidget` dan model data yang tidak boleh berubah setelah dibuat. Anotasi ini membantu linter memberi peringatan jika Anda membuat field non-final dalam kelas yang dianotasikan immutable.
- Tujuan: mengurangi bug akibat state yang berubah di tempat yang tidak terduga dan membuat kontrak kelas lebih jelas.

### Jelaskan fungsi dari anotasi `@override`

Penjelasan singkat:
- `@override` adalah anotasi yang menandakan bahwa sebuah method pada kelas anak (subclass) menimpa (override) method dengan nama yang sama pada superclass.
- Fungsinya:
  - Membuat kode lebih jelas bagi pembaca bahwa method tersebut dimaksudkan untuk mengganti perilaku dari superclass.
  - Membantu analyzer/linter mendeteksi kesalahan (mis-typed method name atau signature tidak cocok) sehingga mencegah bug di waktu kompilasi.
- Contoh umum di Flutter: `@override Widget build(BuildContext context) { ... }` pada `State` atau `StatelessWidget`.

---

## Kesimpulan

Praktikum ini mengajarkan alur pembuatan aplikasi kamera sederhana dan bagaimana mengaplikasikan filter warna secara interaktif menggunakan widget Flutter. 

