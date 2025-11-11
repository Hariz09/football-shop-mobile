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

---

## Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements

### 1. Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()` di Flutter. Dalam skenario apa masing-masing sebaiknya digunakan di aplikasi Football Shop?

**Navigator.push():**
- **Fungsi**: Menambahkan halaman baru ke atas stack navigasi tanpa menghapus halaman sebelumnya
- **Behavior**: User dapat kembali ke halaman sebelumnya dengan tombol back
- **Stack**: Halaman sebelumnya tetap ada di memory dalam navigation stack
- **Use case**: Ketika user perlu kembali ke halaman sebelumnya

**Navigator.pushReplacement():**
- **Fungsi**: Mengganti halaman saat ini dengan halaman baru di stack navigasi
- **Behavior**: User tidak dapat kembali ke halaman sebelumnya dengan tombol back
- **Stack**: Halaman sebelumnya dihapus dari navigation stack
- **Use case**: Ketika user tidak perlu kembali ke halaman sebelumnya (seperti setelah login)

**Skenario penggunaan di Football Shop:**

1. **Navigator.push()** - Digunakan saat:
   - User menekan tombol "Create Product" dari home page → user mungkin ingin kembali ke home tanpa menyimpan
   - User membuka detail produk → user ingin kembali ke daftar produk
   - User membuka form edit → user bisa cancel dan kembali

2. **Navigator.pushReplacement()** - Digunakan saat:
   - User memilih menu di drawer (Halaman Utama/Tambah Produk) → mengganti halaman saat ini, tidak menumpuk halaman
   - Setelah login berhasil → user tidak perlu kembali ke halaman login
   - Setelah logout → user tidak bisa kembali ke halaman yang memerlukan autentikasi

**Contoh implementasi di Football Shop:**
```dart
// Navigator.push - dari home ke form (bisa kembali)
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const ProductEntryFormPage()),
);

// Navigator.pushReplacement - dari drawer menu (replace halaman)
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => MyHomePage()),
);
```

### 2. Bagaimana cara memanfaatkan hierarki widget (Scaffold, AppBar, Drawer) untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

**Hierarki Widget untuk Konsistensi:**

1. **Scaffold** - Foundation Layer
   - Menyediakan struktur dasar Material Design untuk setiap halaman
   - Mengatur layout dengan AppBar, Drawer, Body, BottomNavigationBar, FloatingActionButton
   - Memastikan semua halaman memiliki struktur yang sama
   - Mengelola SnackBar, BottomSheet, dan Dialog

2. **AppBar** - Header Layer
   - Menampilkan judul aplikasi/halaman secara konsisten
   - Menyediakan navigasi (back button, drawer icon)
   - Menampilkan actions (search, settings, dll)
   - Menggunakan tema yang sama di seluruh aplikasi

3. **Drawer** - Navigation Layer
   - Menyediakan menu navigasi yang konsisten di semua halaman
   - Memudahkan akses ke halaman-halaman utama
   - Menampilkan branding aplikasi (logo, nama)

**Implementasi di Football Shop:**

```dart
// Setiap halaman menggunakan struktur yang sama
Scaffold(
  appBar: AppBar(
    title: const Text('Football Shop'),
    backgroundColor: Theme.of(context).colorScheme.primary,
    iconTheme: const IconThemeData(color: Colors.white),
  ),
  drawer: const LeftDrawer(), // Drawer yang sama di semua halaman
  body: // Konten spesifik halaman
)
```

**Keuntungan:**
- **Konsistensi Visual**: Semua halaman terlihat seragam
- **User Experience**: User familiar dengan navigasi di setiap halaman
- **Maintainability**: Perubahan pada drawer/appbar otomatis apply ke semua halaman
- **Reusability**: Widget drawer dapat digunakan di banyak halaman

**Best Practices:**
- Buat widget drawer terpisah (`LeftDrawer`) yang dapat di-reuse
- Gunakan tema global untuk warna AppBar
- Pastikan semua halaman utama memiliki drawer yang sama
- Gunakan consistent naming dan styling

### 3. Dalam konteks desain UI, apa keuntungan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen form? Berikan contoh dari aplikasi Football Shop.

**1. Padding**

**Keuntungan:**
- Memberikan ruang/jarak di sekitar widget
- Meningkatkan readability dan estetika
- Mencegah konten menempel di tepi layar
- Membuat UI lebih breathable dan comfortable

**Contoh di Football Shop:**
```dart
// Di ProductEntryFormPage
Padding(
  padding: const EdgeInsets.all(16.0),
  child: Column(
    children: [
      TextFormField(...), // Form fields dengan spacing yang baik
    ],
  ),
)

// Di InfoCard
Container(
  padding: const EdgeInsets.all(16.0),
  child: Column(...), // Konten tidak menempel di tepi card
)
```

**2. SingleChildScrollView**

**Keuntungan:**
- Memungkinkan konten yang panjang untuk di-scroll
- Mencegah overflow error saat keyboard muncul
- Mendukung berbagai ukuran layar (responsive)
- Memastikan semua form fields dapat diakses

**Contoh di Football Shop:**
```dart
// Di ProductEntryFormPage - form dengan banyak fields
Form(
  child: SingleChildScrollView(
    child: Column(
      children: [
        TextFormField(...), // Name
        TextFormField(...), // Price
        TextFormField(...), // Description
        TextFormField(...), // Thumbnail
        TextFormField(...), // Category
        Switch(...),        // isFeatured
        ElevatedButton(...), // Save button
      ],
    ),
  ),
)
```

**Mengapa penting:**
- Form memiliki 6 input fields + button
- Saat keyboard muncul, form tetap bisa di-scroll
- Mendukung layar kecil tanpa overflow
- User dapat mengakses semua fields dengan mudah

**3. ListView**

**Keuntungan:**
- Efficient rendering untuk list panjang (lazy loading)
- Built-in scrolling behavior
- Mendukung dynamic content
- Memory efficient untuk banyak items

**Contoh di Football Shop:**
```dart
// Di LeftDrawer - menu navigation
Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      DrawerHeader(...),
      ListTile(...), // Halaman Utama
      ListTile(...), // Tambah Produk
      // Bisa ditambah menu lain tanpa overflow
    ],
  ),
)
```

**Perbandingan Layout Widgets:**

| Widget | Use Case | Keuntungan di Form |
|--------|----------|-------------------|
| **Padding** | Spacing & margins | Readability, estetika |
| **SingleChildScrollView** | Long content | Prevent overflow, keyboard handling |
| **ListView** | Dynamic lists | Efficient, scalable |
| **Column** | Vertical layout | Simple, structured |
| **Row** | Horizontal layout | Inline elements |

**Best Practices di Form:**
1. Gunakan `SingleChildScrollView` untuk form dengan banyak fields
2. Tambahkan `Padding` untuk spacing yang konsisten
3. Gunakan `SizedBox` untuk spacing antar fields
4. Kombinasikan dengan `Column` untuk vertical layout
5. Pastikan form responsive di berbagai ukuran layar

### 4. Bagaimana cara kustomisasi tema warna untuk memastikan aplikasi Football Shop memiliki identitas visual yang konsisten sesuai brand toko?

**1. Kustomisasi Tema Global di main.dart**

```dart
MaterialApp(
  title: 'Football Shop',
  theme: ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
      .copyWith(secondary: Colors.blueAccent[400]),
  ),
  home: MyHomePage(),
)
```

**Penjelasan:**
- **Primary Color (Blue)**: Merepresentasikan profesionalisme dan kepercayaan
- **Secondary Color (Blue Accent)**: Untuk aksen dan highlight
- Warna biru cocok untuk toko sepak bola (warna umum di dunia olahraga)

**2. Konsistensi Penggunaan Tema**

**AppBar:**
```dart
AppBar(
  backgroundColor: Theme.of(context).colorScheme.primary,
  iconTheme: const IconThemeData(color: Colors.white),
)
```

**Buttons:**
```dart
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: Theme.of(context).colorScheme.primary,
    foregroundColor: Colors.white,
  ),
)
```

**Switch:**
```dart
Switch(
  activeColor: Theme.of(context).colorScheme.primary,
)
```

**3. Color Palette untuk Football Shop**

**Implementasi saat ini:**
- **Primary**: Blue - Profesional, trustworthy
- **Secondary**: Blue Accent - Energetic, sporty
- **Item Cards**:
  - Blue (All Products) - Informasi
  - Green (My Products) - Success/Personal
  - Red (Create Product) - Action/Important

**4. Keuntungan Kustomisasi Tema:**

1. **Konsistensi Visual**
   - Semua komponen menggunakan warna yang sama
   - Brand identity yang kuat
   - Professional appearance

2. **Maintainability**
   - Ubah warna di satu tempat (theme)
   - Otomatis apply ke seluruh aplikasi
   - Mudah untuk rebrand

3. **User Experience**
   - Familiar color scheme
   - Visual hierarchy yang jelas
   - Mudah dikenali

4. **Accessibility**
   - Kontras warna yang baik (blue & white)
   - Readable text
   - Clear visual cues

**5. Best Practices:**

```dart
// Gunakan theme colors, bukan hardcoded colors
// ❌ Bad
backgroundColor: Colors.blue

// ✅ Good
backgroundColor: Theme.of(context).colorScheme.primary

// Untuk custom colors, definisikan di theme
theme: ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.blue,
  ).copyWith(
    secondary: Colors.blueAccent[400],
    error: Colors.red,
    surface: Colors.white,
  ),
)
```

**6. Rekomendasi untuk Football Shop:**

Untuk identitas brand yang lebih kuat, bisa menggunakan:
- **Primary**: Dark Blue/Navy - Profesional, sporty
- **Secondary**: Orange/Yellow - Energetic, action
- **Accent**: Green - Success, achievement
- **Background**: White/Light Gray - Clean, modern

Ini akan memberikan tampilan yang lebih sporty dan energetic sesuai dengan tema sepak bola.