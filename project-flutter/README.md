# Project Flutter - Mobile Programming

Repository ini berisi project-project Flutter untuk mata kuliah Mobile Programming.

## Struktur Folder

```
project-flutter/
├── app/                    # Berisi aplikasi Flutter
│   └── hello_world/       # Praktikum 1: Project Flutter pertama
├── screenshots/           # Screenshot aplikasi
├── laporan-proyek.md     # Laporan project akhir
└── README.md            # Dokumentasi project (file ini)
```

## Praktikum 1: Membuat Project Flutter Baru

### Tujuan
Membuat project Flutter baru dengan nama `hello_world` dan memahami struktur dasar project Flutter.

### Langkah-langkah

#### Langkah 1: Membuka Command Palette
- Buka VS Code
- Tekan `Ctrl + Shift + P` untuk membuka Command Palette
- Ketik "Flutter" dan pilih "New Application Project"

#### Langkah 2: Memilih Lokasi Project
- Pilih folder `project-flutter/app` sebagai lokasi project
- Klik "Select a folder to create the project in"

#### Langkah 3: Membuat Nama Project
- Buat nama project: `hello_world`
- Pastikan menggunakan huruf kecil semua (lowercase)
- Gunakan underscore (_) untuk memisahkan kata
- Tekan Enter dan tunggu proses selesai

#### Langkah 4: Verifikasi Project
- Pastikan project berhasil dibuat dengan pesan "Your Flutter Project is ready!"
- Struktur project Flutter standar sudah terbentuk

### Hasil

Project Flutter `hello_world` berhasil dibuat dengan struktur sebagai berikut:

```
hello_world/
├── android/              # Konfigurasi Android
├── ios/                 # Konfigurasi iOS
├── lib/                 # Kode Dart utama
│   └── main.dart       # Entry point aplikasi
├── test/               # File testing
├── web/                # Konfigurasi Web
├── pubspec.yaml        # Dependencies dan metadata
└── README.md          # Dokumentasi project
```

### Cara Menjalankan

1. Buka terminal di folder `project-flutter/app/hello_world`

### Screenshot

Screenshots aplikasi disimpan di folder `screenshots/` dengan format penamaan yang jelas:

#### Cara Menambahkan Screenshot:
1. **Ambil screenshot** aplikasi saat berjalan
2. **Simpan gambar** ke folder `screenshots/` dengan nama yang deskriptif
3. **Tambahkan ke README** menggunakan sintaks Markdown

#### Contoh Sintaks Screenshot di Markdown:

**Metode 1: Gambar Lokal (Relative Path)**
```markdown
![Deskripsi Gambar](screenshots/01.png)
```

**Metode 2: Gambar dengan Link**
```markdown
![Deskripsi](screenshots/nama_file.png "Tooltip Text")
```

**Metode 3: Gambar dengan Ukuran Custom (HTML)**
```html
<img src="screenshots/nama_file.png" alt="Deskripsi" width="300">
```

**Metode 4: Multiple Screenshots**
```markdown
| Home Screen | Counter App | Menu |
|-------------|-------------|------|
| ![Home](screenshots/home.png) | ![Counter](screenshots/counter.png) | ![Menu](screenshots/menu.png) |
```

#### Screenshots Praktikum 1:

> **Note:** Setelah menjalankan aplikasi, ambil screenshot dan simpan dengan nama berikut:

- `praktikum1_home_screen.png` - Tampilan awal aplikasi
- `praktikum1_counter_increment.png` - Setelah menekan tombol beberapa kali
- `praktikum1_code_structure.png` - Screenshot struktur kode di VS Code

**Contoh implementasi:**
```markdown
![Home Screen](screenshots/praktikum1_home_screen.png)
*Tampilan awal aplikasi Hello World*

![Counter Demo](screenshots/praktikum1_counter_increment.png)
*Aplikasi setelah tombol + ditekan beberapa kali*
```

### Catatan

- Nama project harus lowercase tanpa spasi
- Tidak boleh diawali dengan angka atau karakter khusus
- Nama project berbeda dengan nama aplikasi yang akan tampil di store
- Untuk deployment, nama aplikasi dapat diatur kemudian

---
