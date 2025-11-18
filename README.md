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

---

## Tugas 9: Integrasi Layanan Web Django dengan Aplikasi Flutter

### 1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan `Map<String, dynamic>` tanpa model?

**Mengapa perlu membuat model Dart:**

1. **Type Safety**: Model Dart memberikan type safety yang kuat. Setiap field memiliki tipe data yang jelas (String, int, bool, dll), sehingga compiler dapat mendeteksi error tipe data saat compile time, bukan runtime.

2. **Autocomplete & IntelliSense**: Dengan model, IDE dapat memberikan autocomplete dan suggestion untuk field-field yang tersedia, meningkatkan produktivitas developer.

3. **Validasi Data**: Model memungkinkan kita melakukan validasi data saat parsing JSON. Jika struktur JSON tidak sesuai, kita bisa menangani error dengan lebih baik.

4. **Maintainability**: Kode lebih mudah dipelihara karena struktur data terdefinisi dengan jelas. Jika ada perubahan struktur data, kita hanya perlu update model di satu tempat.

5. **Dokumentasi**: Model berfungsi sebagai dokumentasi hidup tentang struktur data yang digunakan aplikasi.

**Konsekuensi jika langsung memetakan `Map<String, dynamic>`:**

1. **Null Safety Issues**: Tidak ada jaminan bahwa key yang kita akses ada dalam Map. Bisa menyebabkan null pointer exception saat runtime.

2. **Runtime Errors**: Error tipe data baru terdeteksi saat aplikasi berjalan, bukan saat compile. Misalnya, mengakses `map['price']` yang seharusnya int tapi ternyata String.

3. **Typo Errors**: Salah ketik nama key (misalnya `map['nmae']` instead of `map['name']`) tidak akan terdeteksi compiler.

4. **Sulit Refactor**: Jika struktur data berubah, kita harus mencari dan mengubah semua tempat yang mengakses Map tersebut secara manual.

5. **Kode Tidak Scalable**: Semakin besar aplikasi, semakin sulit melacak struktur data yang digunakan.

**Contoh dalam proyek:**
```dart
// Dengan Model - Type Safe
ProductEntry product = ProductEntry.fromJson(jsonData);
String name = product.fields.name; // Compiler tahu ini String
int price = product.fields.price;   // Compiler tahu ini int

// Tanpa Model - Tidak Type Safe
Map<String, dynamic> product = jsonData;
String name = product['fields']['name']; // Bisa null, bisa salah tipe
int price = product['fields']['price'];   // Runtime error jika tipe salah
```


### 2. Apa fungsi package _http_ dan _CookieRequest_ dalam tugas ini? Jelaskan perbedaan peran _http_ vs _CookieRequest_.

**Package `http`:**

Fungsi:
- Package standar untuk melakukan HTTP requests (GET, POST, PUT, DELETE) di Flutter
- Menyediakan API sederhana untuk komunikasi dengan web service
- Menangani request/response HTTP dasar

Penggunaan dalam proyek:
```dart
import 'package:http/http.dart' as http;

// Contoh GET request
final response = await http.get(Uri.parse('http://localhost:8000/json/'));
// Contoh POST request
final response = await http.post(
  Uri.parse('http://localhost:8000/api/'),
  body: jsonEncode(data),
);
```

**Package `pbp_django_auth` (CookieRequest):**

Fungsi:
- Package khusus untuk integrasi Flutter dengan Django authentication
- Menangani session management dan cookie persistence
- Menyimpan state login user
- Otomatis mengirim cookie authentication di setiap request

Penggunaan dalam proyek:
```dart
final request = context.watch<CookieRequest>();

// Login - menyimpan cookie session
await request.login("http://localhost:8000/auth/login/", {
  'username': username,
  'password': password,
});

// Request dengan authentication
await request.get('http://localhost:8000/json/');
```

**Perbedaan Peran:**

| Aspek | http | CookieRequest |
|-------|------|---------------|
| **State Management** | Stateless - tidak menyimpan state | Stateful - menyimpan session & cookies |
| **Authentication** | Manual - harus handle sendiri | Otomatis - terintegrasi dengan Django auth |
| **Cookie Handling** | Tidak otomatis | Otomatis persist dan kirim cookies |
| **Use Case** | Request sederhana tanpa auth | Request yang memerlukan authentication |
| **Session** | Tidak ada session management | Ada session management |

**Kapan menggunakan masing-masing:**
- **http**: Untuk API publik yang tidak memerlukan authentication
- **CookieRequest**: Untuk API yang memerlukan user authentication (seperti dalam tugas ini)

### 3. Jelaskan mengapa *instance* CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

**Alasan CookieRequest perlu dibagikan:**

1. **Single Source of Truth untuk Authentication State**
   - Semua komponen perlu tahu apakah user sudah login atau belum
   - Status login disimpan dalam satu instance CookieRequest
   - Jika setiap komponen punya instance sendiri, state bisa tidak sinkron

2. **Konsistensi Session & Cookies**
   - Cookie session dari Django harus sama di semua request
   - Jika setiap komponen punya instance berbeda, cookie-nya juga berbeda
   - Bisa menyebabkan user terlihat login di satu halaman tapi tidak di halaman lain

3. **Efisiensi Memory**
   - Membuat satu instance dan share lebih efisien daripada membuat banyak instance
   - Menghindari duplikasi data session

4. **Sinkronisasi State**
   - Ketika user logout di satu halaman, semua halaman lain harus tahu
   - Dengan shared instance, perubahan state langsung terlihat di semua komponen

**Implementasi dalam proyek:**

```dart
// Di main.dart - membuat Provider di root
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;  // Instance ini dibagikan ke semua child widgets
      },
      child: MaterialApp(...),
    );
  }
}

// Di komponen lain - mengakses instance yang sama
class ProductListPage extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>(); // Mendapat instance yang sama
    // Gunakan request untuk fetch data
  }
}

class LoginPage extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>(); // Instance yang sama
    // Gunakan request untuk login
  }
}
```

**Tanpa sharing instance:**
- User login di LoginPage → Instance A punya session
- Pindah ke ProductListPage → Instance B tidak punya session
- ProductListPage tidak bisa fetch data karena tidak authenticated
- Inkonsistensi state di seluruh aplikasi


### 4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android?

**Konfigurasi yang diperlukan:**

**A. Django Settings (settings.py):**

1. **ALLOWED_HOSTS**
```python
ALLOWED_HOSTS = ['localhost', '127.0.0.1', '10.0.2.2']
```
- `10.0.2.2` adalah IP khusus untuk Android emulator mengakses localhost komputer host
- Android emulator berjalan di virtual machine terpisah
- `localhost` di emulator ≠ `localhost` di komputer
- `10.0.2.2` di emulator = `localhost` di komputer host

2. **CORS (Cross-Origin Resource Sharing)**
```python
INSTALLED_APPS = [
    ...
    'corsheaders',
]

MIDDLEWARE = [
    'corsheaders.middleware.CorsMiddleware',
    ...
]

CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
```
- Flutter web berjalan di origin berbeda dari Django (misalnya localhost:8000 vs localhost:5000)
- Browser memblokir request cross-origin secara default untuk keamanan
- CORS mengizinkan Flutter mengakses API Django dari origin berbeda
- `ALLOW_CREDENTIALS` diperlukan untuk mengirim cookies

3. **Cookie Settings**
```python
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SAMESITE = 'None'
SESSION_COOKIE_SAMESITE = 'None'
```
- `SameSite='None'` mengizinkan cookie dikirim dalam cross-site requests
- Diperlukan karena Flutter dan Django berjalan di origin berbeda
- `Secure=True` memastikan cookie hanya dikirim via HTTPS (production)

**B. Android Configuration (AndroidManifest.xml):**

```xml
<uses-permission android:name="android.permission.INTERNET" />
```
- Android secara default tidak mengizinkan aplikasi mengakses internet
- Permission ini harus dideklarasikan eksplisit
- Tanpa ini, semua HTTP request akan gagal

**Mengapa semua ini diperlukan:**

1. **10.0.2.2 di ALLOWED_HOSTS:**
   - Tanpa ini: Django akan reject request dari Android emulator dengan error "Invalid HTTP_HOST header"
   - Django memvalidasi Host header untuk keamanan
   - Android emulator perlu IP khusus ini untuk akses localhost

2. **CORS:**
   - Tanpa ini: Browser akan block request dengan error "CORS policy: No 'Access-Control-Allow-Origin' header"
   - Flutter web tidak bisa fetch data dari Django
   - API calls akan gagal di browser

3. **SameSite/Cookie Settings:**
   - Tanpa ini: Cookie session tidak akan dikirim dalam cross-origin requests
   - User akan terlihat tidak login meskipun sudah login
   - Authentication akan gagal

4. **Internet Permission di Android:**
   - Tanpa ini: Aplikasi tidak bisa melakukan network requests sama sekali
   - Semua HTTP calls akan throw exception
   - Aplikasi tidak bisa berkomunikasi dengan server

**Flow komunikasi:**
```
Flutter App (Android Emulator)
    ↓ 
HTTP Request ke http://10.0.2.2:8000
    ↓ 
(Internet Permission diperlukan)
    ↓
Android OS
    ↓ 
Translate 10.0.2.2 → localhost komputer host
    ↓
Django Server (localhost:8000)
    ↓ 
Check ALLOWED_HOSTS (10.0.2.2 harus ada)
    ↓ 
Check CORS (harus allow origin)
    ↓ 
Process request dengan session cookie
    ↓ 
Return response dengan CORS headers
    ↓
Flutter App (terima response)
```

---

## 5. Mekanisme Pengiriman Data dari Input hingga Tampil di Flutter

### A. Input Data di Flutter

1. User mengisi form, setiap perubahan disimpan ke variabel state.
2. Saat tombol Save ditekan

   * Validasi form
   * Data dijadikan JSON
   * Flutter mengirim **POST JSON** ke Django menggunakan `CookieRequest`

### B. Pemrosesan di Django

1. Django menerima body JSON pada view `create_product_flutter`
2. Data di-parse, divalidasi, lalu dibuat `Product` baru
3. Data disimpan ke database
4. Django mengirim JSON response (status dan pesan)

### C. Menampilkan Data di Flutter

1. Flutter melakukan **GET request** ke endpoint Django untuk mengambil daftar produk
2. Django mengquery database lalu mengirim JSON hasil serialisasi
3. Flutter mem-parse JSON menjadi model `ProductEntry`
4. FutureBuilder menampilkan data dalam ListView

---

### Alur Singkat

```
Flutter Form
  ↓
Validasi + Encode JSON
  ↓
POST ke Django (CookieRequest)
  ↓
Django Parse + Validasi
  ↓
Save ke Database
  ↓
Django kirim JSON Response
  ↓
Flutter tampilkan status
  ↓
Flutter GET ulang data
  ↓
Django kirim JSON list
  ↓
Flutter parse → model
  ↓
UI ListView menampilkan produk
```

---

## 6. Mekanisme Autentikasi: Register, Login, Logout

### A. Register

1. Flutter: user isi form → kirim JSON ke `/auth/register/`
2. Django: parse data → cek kecocokan password dan username unik → buat user → simpan ke database
3. Django kirim respons sukses → Flutter pindah ke halaman login

---

### B. Login

1. Flutter: kirim username & password ke `/auth/login/`
2. Django: lakukan `authenticate` → jika valid, buat session → kirim cookie session ke Flutter
3. CookieRequest menyimpan cookie → dipakai otomatis untuk request berikutnya

---

### C. Logout

1. Flutter: kirim request ke `/auth/logout/` (dengan cookie)
2. Django: hapus session → kirim respons sukses
3. Flutter menghapus cookie lokal dan kembali ke login

---

### Alur Singkat

```
REGISTER:
Flutter → POST register → Django buat user → sukses

LOGIN:
Flutter → POST login → Django verifikasi → buat session → cookie dikirim → sukses

REQUEST SETELAH LOGIN:
Flutter (bawa cookie) → Django cek session → kirim data

LOGOUT:
Flutter → POST logout → Django hapus session → cookie terhapus
```


Berikut versi paling ringkas, ditulis dalam pandangan orang pertama.

---

## 7. Step-by-Step Implementasi

### 1. Setup Autentikasi

Saya meng-install paket `provider`, `pbp_django_auth`, dan `http`, lalu men-setup `CookieRequest` di `main.dart` dengan Provider. Setelah itu saya menambah permission internet di AndroidManifest.

### 2. Membuat Halaman Login

Saya membuat file login, menambahkan form untuk username dan password, lalu menghubungkannya ke endpoint Django menggunakan `request.login`. Jika berhasil, saya arahkan user ke halaman utama.

### 3. Membuat Halaman Register

Saya membuat halaman register dengan validasi password dan mengirim datanya lewat `postJson`. Setelah sukses, saya arahkan user kembali ke login.

### 4. Membuat Model

Saya mengambil JSON dari endpoint Django, mem-paste ke Quicktype, lalu menyalin model Dart yang dihasilkan ke file `product_entry.dart`.

### 5. Halaman Daftar Produk

Saya membuat halaman list yang mem-fetch data dengan `CookieRequest.get`, mem-parse menjadi model, dan menampilkannya dengan FutureBuilder.

### 6. Halaman Detail Produk

Saya membuat halaman detail yang menerima `ProductEntry` dan menampilkan seluruh field-nya.

### 7. Update Navigasi

Saya menambahkan menu menuju Product List dan Logout di `left_drawer.dart`, dan menambahkan navigasi pada `product_card.dart`.

### 8. Integrasi Form dengan Django

Saya memperbarui form input produk untuk mengirim data ke Django dengan `postJson`, lalu kembali ke home saat berhasil.

### 9. Testing

Saya menjalankan server Django dan Flutter, lalu menguji seluruh alur: Register → Login → Tambah Produk → Lihat List → Lihat Detail → Logout.