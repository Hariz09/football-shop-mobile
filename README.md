# Football Shop

Aplikasi Flutter untuk toko sepak bola yang menampilkan produk-produk sepak bola.

## Informasi Mahasiswa
- **Nama**: M Hariz Albaari
- **NPM**: 2406428775
- **Kelas**: E

## Jawaban Pertanyaan

### 1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.

**Widget Tree** adalah struktur hierarki dari widget-widget yang membentuk user interface di Flutter. Setiap aplikasi Flutter memiliki widget tree yang dimulai dari root widget (biasanya `MaterialApp` atau `CupertinoApp`) dan bercabang ke widget-widget child di bawahnya.

**Hubungan Parent-Child:**
- **Parent widget** adalah widget yang mengandung widget lain di dalamnya
- **Child widget** adalah widget yang berada di dalam parent widget
- Setiap widget dapat memiliki satu atau lebih child widgets (tergantung jenis widgetnya)
- Widget seperti `Container`, `Center`, `Padding` hanya bisa memiliki satu child
- Widget seperti `Column`, `Row`, `ListView` bisa memiliki banyak children
- Properti dan constraint dari parent widget mempengaruhi child widget (seperti ukuran, posisi, tema)
- Child widget mewarisi `BuildContext` dari parent-nya, yang memungkinkan akses ke informasi tentang posisi widget dalam tree

**Contoh dalam proyek ini:**
```
MyApp (root)
└── MaterialApp
    └── MyHomePage
        └── Scaffold
            ├── AppBar
            │   └── Text
            └── Body (Padding)
                └── Column
                    ├── Row (InfoCards)
                    └── GridView (ItemCards)
```

### 2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

1. **MaterialApp**: Widget root yang menyediakan struktur dasar aplikasi Material Design, mengatur tema, routing, dan konfigurasi aplikasi
2. **Scaffold**: Menyediakan struktur layout dasar Material Design dengan AppBar, Body, dan komponen lainnya
3. **AppBar**: Bar di bagian atas aplikasi yang menampilkan judul dan bisa berisi actions
4. **Text**: Menampilkan teks dengan styling tertentu
5. **Padding**: Memberikan jarak/padding di sekitar child widget
6. **Column**: Menyusun children widgets secara vertikal (dari atas ke bawah)
7. **Row**: Menyusun children widgets secara horizontal (dari kiri ke kanan)
8. **Card**: Membuat kotak dengan elevasi (bayangan) untuk menampilkan informasi
9. **Container**: Widget serbaguna untuk styling, sizing, dan positioning
10. **GridView.count**: Menampilkan children dalam bentuk grid dengan jumlah kolom tetap
11. **Material**: Memberikan efek visual Material Design seperti warna dan border radius
12. **InkWell**: Memberikan efek ripple saat widget ditekan dan menangani gesture tap
13. **Icon**: Menampilkan ikon dari Material Icons
14. **SizedBox**: Memberikan jarak/spacing dengan ukuran tetap
15. **Center**: Menempatkan child widget di tengah
16. **SnackBar**: Menampilkan pesan sementara di bagian bawah layar
17. **ScaffoldMessenger**: Mengelola dan menampilkan SnackBar dalam Scaffold

### 3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.

**Fungsi MaterialApp:**
- Menyediakan konfigurasi dasar untuk aplikasi Material Design
- Mengatur tema aplikasi (warna, font, brightness)
- Mengelola routing dan navigasi antar halaman
- Menyediakan widget-widget Material Design seperti Scaffold, AppBar, dll
- Mengatur locale dan internationalization
- Menyediakan MediaQuery untuk responsive design
- Mengatur title aplikasi yang muncul di task manager

**Mengapa sering digunakan sebagai root widget:**
1. **Standar Material Design**: Mengikuti design guidelines dari Google yang sudah familiar bagi pengguna Android
2. **Lengkap dan Siap Pakai**: Menyediakan banyak komponen UI yang sudah jadi dan konsisten
3. **Tema Terpusat**: Memudahkan pengaturan tema aplikasi secara global dari satu tempat
4. **Navigator Built-in**: Sudah include sistem navigasi yang powerful
5. **Konsistensi**: Memastikan semua widget child mengikuti Material Design principles
6. **Cross-platform**: Memberikan tampilan yang konsisten di berbagai platform

### 4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

**StatelessWidget:**
- Widget yang **tidak memiliki state** yang bisa berubah
- Immutable - sekali dibuat, propertinya tidak bisa diubah
- Hanya memiliki method `build()` yang dipanggil sekali (atau saat parent rebuild)
- Lebih ringan dan efisien dalam hal performa
- Cocok untuk UI yang statis

**StatefulWidget:**
- Widget yang **memiliki state** yang bisa berubah selama lifecycle aplikasi
- Mutable - bisa berubah berdasarkan user interaction atau data changes
- Memiliki dua class: widget class dan state class
- State class memiliki method `setState()` untuk trigger rebuild
- Bisa merespons perubahan data, user input, atau events

**Kapan memilih StatelessWidget:**
- UI yang tidak berubah (static content)
- Hanya menampilkan data tanpa interaksi yang mengubah tampilan
- Contoh: Text, Icon, Image yang tidak berubah, InfoCard dalam proyek ini

**Kapan memilih StatefulWidget:**
- UI yang berubah berdasarkan user interaction
- Form dengan input fields
- Animasi
- Data yang di-fetch dari API dan perlu di-update
- Counter, timer, atau nilai yang berubah
- Contoh: Form input, checkbox, slider, list yang bisa di-filter

**Dalam proyek ini**, saya menggunakan **StatelessWidget** karena:
- UI hanya menampilkan informasi statis (NPM, nama, kelas)
- Button hanya menampilkan SnackBar tanpa mengubah state aplikasi
- Tidak ada data yang perlu di-track atau di-update

### 5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?

**BuildContext** adalah:
- Handle/referensi ke lokasi widget dalam widget tree
- Objek yang merepresentasikan posisi widget dalam hierarki
- Diberikan sebagai parameter di method `build()`
- Setiap widget memiliki BuildContext-nya sendiri

**Mengapa penting:**
1. **Akses ke Parent Widgets**: Memungkinkan widget mengakses data dari widget parent di atasnya dalam tree
2. **Theme Access**: Mengakses tema aplikasi dengan `Theme.of(context)`
3. **MediaQuery**: Mendapatkan informasi ukuran layar dengan `MediaQuery.of(context)`
4. **Navigation**: Navigasi antar halaman dengan `Navigator.of(context)`
5. **Scaffold Features**: Menampilkan SnackBar, Dialog dengan `ScaffoldMessenger.of(context)`
6. **InheritedWidget**: Mengakses data yang di-share melalui InheritedWidget

**Penggunaan di method build:**
```dart
@override
Widget build(BuildContext context) {
  // Mengakses tema
  final theme = Theme.of(context);

  // Mengakses ukuran layar
  final screenWidth = MediaQuery.of(context).size.width;

  // Menampilkan SnackBar
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text("Hello"))
  );

  return Widget(...);
}
```

**Dalam proyek ini**, BuildContext digunakan untuk:
- Mengakses tema: `Theme.of(context).colorScheme.primary`
- Mengakses ukuran layar: `MediaQuery.of(context).size.width`
- Menampilkan SnackBar: `ScaffoldMessenger.of(context).showSnackBar()`

### 6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

**Hot Reload:**
- **Definisi**: Fitur yang memungkinkan developer melihat perubahan kode secara instan tanpa restart aplikasi
- **Cara kerja**: Inject updated source code ke running Dart VM, rebuild widget tree
- **Kecepatan**: Sangat cepat (biasanya < 1 detik)
- **State**: **Mempertahankan state** aplikasi yang sedang berjalan
- **Kapan digunakan**: Perubahan UI, styling, logic dalam method
- **Shortcut**: `r` di terminal atau tombol hot reload di IDE

**Hot Restart:**
- **Definisi**: Restart aplikasi dari awal dengan kode yang baru
- **Cara kerja**: Restart Dart VM dan aplikasi dari main()
- **Kecepatan**: Lebih lambat dari hot reload (beberapa detik)
- **State**: **Menghapus semua state** dan mulai dari awal
- **Kapan digunakan**: Perubahan di main(), initState(), global variables, atau saat hot reload tidak cukup
- **Shortcut**: `R` (kapital) di terminal atau tombol hot restart di IDE

**Perbedaan Utama:**

| Aspek | Hot Reload | Hot Restart |
|-------|-----------|-------------|
| Kecepatan | Sangat cepat (~1s) | Lebih lambat (~3-5s) |
| State | Dipertahankan | Dihapus/reset |
| Perubahan | UI, method, widget | Semua perubahan |
| Use case | Development iteratif | Perubahan fundamental |

**Contoh:**
- **Hot Reload**: Mengubah warna button dari biru ke merah - state tetap, hanya warna yang berubah
- **Hot Restart**: Mengubah initial data di constructor - perlu restart untuk apply perubahan

**Limitasi Hot Reload:**
- Tidak bisa mengubah signature class (menambah/menghapus field)
- Tidak bisa mengubah global variables atau static fields
- Tidak bisa mengubah main() function
- Tidak bisa mengubah initState() yang sudah dijalankan

Dalam kasus tersebut, gunakan **Hot Restart**.