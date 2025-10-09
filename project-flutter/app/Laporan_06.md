# Laporan Jobsheet 6 - Layout dan Navigasi

**Nama:** Indira Nafa Aurah Huda  
**NIM:** 2341720001  
**Kelas:** TI-3E  
**Mata Kuliah:** Mobile Programming

---

## Praktikum 1: Membangun Layout di Flutter

Pada praktikum ini, saya membuat aplikasi Flutter dengan layout dasar yang menampilkan "Hello World". Praktikum dimulai dengan membuat project baru bernama `layout_flutter`, kemudian mengimplementasikan title section yang berisi informasi wisata Sumber Sira di Malang. Title section terdiri dari kolom teks (nama lokasi dan alamat) yang menggunakan widget `Expanded`, ikon bintang berwarna merah, dan rating angka. Layout menggunakan `Container` dengan padding dan `Row` untuk penataan horizontal.

![Screenshot Praktikum 1](screenshot/JB6_01.png)

---

## Praktikum 2: Implementasi Button Row

Praktikum ini mengimplementasikan baris tombol interaktif dengan tiga aksi utama: CALL, ROUTE, dan SHARE. Saya membuat method helper `_buildButtonColumn()` yang menerima parameter warna, ikon, dan label untuk membuat kolom button yang konsisten. Button section menggunakan widget `Row` dengan `MainAxisAlignment.spaceEvenly` untuk mendistribusikan tombol secara merata. Setiap tombol terdiri dari ikon dan teks label dengan styling yang seragam menggunakan tema aplikasi.
![Screenshot dengan Button Section](screenshot/JB6_02.png)

---

## Praktikum 3: Implementasi Text Section

Pada praktikum ini, saya menambahkan section deskripsi teks yang berisi informasi detail tentang wisata Sumber Sira. Text section menggunakan widget `Container` dengan padding 32 piksel dan properti `softWrap: true` untuk memastikan teks dapat terbungkus dengan baik. Deskripsi menceritakan tentang keindahan alam Sumber Sira sebagai destinasi wisata keluarga di Malang, Jawa Timur dengan suasana yang tenang dan sejuk.
![Screenshot dengan Text Section](screenshot/JB6_03.png)

---

## Praktikum 4: Implementasi Image Section

Praktikum terakhir mengimplementasikan gambar sebagai header utama layout. Saya menambahkan asset gambar `sumber_sira.jpg` ke folder assets dan mengkonfigurasi `pubspec.yaml`. Gambar ditampilkan menggunakan `Image.asset()` dengan `BoxFit.cover` yang memastikan gambar menutupi area render secara proporsional. Layout akhir menggunakan `ListView` sebagai pengganti `Column` untuk mendukung scrolling ketika konten melebihi tinggi layar. Hasil final menampilkan layout lengkap dengan gambar, title section, button section, dan text section yang tersusun vertikal.

![Screenshot dengan Image Section](screenshot/JB6_04.png)

---

## Kesimpulan

Pada praktikum Layout dan Navigasi ini, berhasil diimplementasikan aplikasi Flutter dengan layout yang kompleks dan menarik. Aplikasi menampilkan informasi wisata Sumber Sira dengan struktur yang terdiri dari gambar header, informasi lokasi dengan rating, tombol interaktif, dan deskripsi detail.