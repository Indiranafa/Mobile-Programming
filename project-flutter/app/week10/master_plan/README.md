# master_plan

Praktikum: Basic State (Week 10) — Master Plan

Ringkasan
- **Status:** Implemented model layer (`Task`, `Plan`), `PlanScreen` view, dan pengaturan `main.dart`.
- **Test:** Widget test (`test/widget_test.dart`) lulus di lingkungan pengembangan ini.

Perubahan utama
- `lib/models/task.dart` — class `Task` (atribut `description`, `complete`).
- `lib/models/plan.dart` — class `Plan` (atribut `name`, `tasks`).
- `lib/models/data_layer.dart` — barrel export untuk model.
- `lib/views/plan_screen.dart` — `PlanScreen` (StatefulWidget) dengan `ScrollController`, tombol tambah, `ListView.builder`, `Checkbox` dan `TextFormField` untuk setiap task.
- `lib/main.dart` — menambahkan `MasterPlanApp` yang menjalankan `PlanScreen`. Untuk kompatibilitas test, `MyApp` counter demo tetap ada.

Menjalankan dan menguji (Windows PowerShell)
```powershell
cd 'c:\Mobile-Programming\project-flutter\app\week10\master_plan'
flutter pub get
flutter analyze
flutter test test\widget_test.dart
```

Menjalankan aplikasi pada device yang tersedia
```powershell
flutter devices
flutter run -d <device-id>
```

Membuat GIF hasil akhir (panduan)
- Saya tidak dapat merekam layar secara langsung dari agen ini. Berikut langkah yang dapat Anda lakukan di mesin Anda:
	1. Jalankan app pada device atau emulator: `flutter run -d windows` atau `flutter run -d <android-id>`.
	2. Rekam layar:
		 - Android emulator: Use `More > Screen record` atau `adb shell screenrecord /sdcard/rec.mp4` lalu `adb pull /sdcard/rec.mp4`.
		 - Perangkat Android: gunakan `scrcpy --record file.mp4`.
		 - Windows desktop: gunakan screen recorder pilihan Anda.
	3. Convert MP4 ke GIF (dengan `ffmpeg`):
```powershell
ffmpeg -i recording.mp4 -vf "fps=15,scale=480:-1:flags=lanczos" -loop 0 demo.gif
```
	4. Letakkan `demo.gif` di `assets/demo.gif` dan tambahkan referensi di README jika perlu.

Penjelasan teknis (jawaban soal)

1) Maksud Langkah 4 (`data_layer.dart`) — mengapa dilakukan demikian?
- `data_layer.dart` adalah barrel file yang mengekspor beberapa model. Tujuannya:
	- Menyederhanakan impor ke file yang menggunakan model — cukup import satu file.
	- Mempermudah pemeliharaan saat model bertambah.

2) Mengapa perlu variabel `plan` di Langkah 6 dan mengapa dibuat `const`?
- `plan` adalah sumber kebenaran (single source of truth) untuk layar: menyimpan `name` dan `tasks`.
- Menggunakan `const Plan()` sebagai default membantu menegaskan immutability awal dan dapat sedikit mengoptimalkan alokasi. Pola yang digunakan adalah membuat instance baru untuk setiap perubahan (immutable update), sehingga state lebih mudah diprediksi.

3) Apa yang dibuat pada Langkah 9 dan penjelasan GIF
- Langkah 9 membuat `_buildTaskTile` yang menampilkan setiap `Task` sebagai `ListTile` berisi `Checkbox` dan `TextFormField`.
- Interaksi yang terlihat pada GIF:
	- Tekan tombol `+` untuk menambahkan task baru.
	- Isi deskripsi task di `TextFormField`.
	- Tandai `Checkbox` untuk mengubah status `complete`.
	Semua perubahan dibuat dengan memanggil `setState` dan mengganti `plan` dengan instance baru.

4) Kegunaan method di Langkah 11 (`initState`) dan Langkah 13 (`dispose`)
- `initState`: di sini `ScrollController` dibuat dan diberi listener yang menghapus fokus dari semua `TextField` saat scroll, sehingga keyboard menutup otomatis pada iOS saat pengguna menggulir.
- `dispose`: melepaskan `scrollController` untuk mencegah memory leak dan callback berjalan setelah widget dihapus.

Catatan
- Jika Anda ingin saya mengganti `AppBar` menjadi nama panggilan Anda, sebutkan nama panggilan tersebut.
- Saya dapat membantu membuat GIF jika Anda mengunggah rekaman MP4; saya akan bantu konversi ke GIF dan menambahkannya ke repo.

Terima kasih — beri tahu saya langkah tambahan apa yang Anda inginkan.
