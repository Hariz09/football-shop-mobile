import 'package:flutter/material.dart';

class ProductEntryFormPage extends StatefulWidget {
  const ProductEntryFormPage({super.key});

  @override
  State<ProductEntryFormPage> createState() => _ProductEntryFormPageState();
}

class _ProductEntryFormPageState extends State<ProductEntryFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  String _description = "";
  String _thumbnail = "";
  String? _category;
  bool _isFeatured = false;

  // Football shop categories
  final List<String> _categories = [
    'Sepatu Bola',
    'Jersey',
    'Celana Olahraga',
    'Bola',
    'Sarung Tangan Kiper',
    'Shin Guards',
    'Tas Olahraga',
    'Aksesoris',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Form Tambah Produk',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name field
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama Produk",
                    labelText: "Nama Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Nama produk tidak boleh kosong!";
                    }
                    if (value.length < 3) {
                      return "Nama produk minimal 3 karakter!";
                    }
                    if (value.length > 100) {
                      return "Nama produk maksimal 100 karakter!";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                // Price field
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Harga",
                    labelText: "Harga",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (String? value) {
                    setState(() {
                      _price = int.tryParse(value!) ?? 0;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Harga tidak boleh kosong!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Harga harus berupa angka!";
                    }
                    if (int.tryParse(value)! <= 0) {
                      return "Harga harus lebih dari 0!";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                // Description field
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Deskripsi",
                    labelText: "Deskripsi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  maxLines: 3,
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Deskripsi tidak boleh kosong!";
                    }
                    if (value.length < 10) {
                      return "Deskripsi minimal 10 karakter!";
                    }
                    if (value.length > 500) {
                      return "Deskripsi maksimal 500 karakter!";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                // Thumbnail field
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "URL Gambar",
                    labelText: "URL Gambar",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _thumbnail = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "URL gambar tidak boleh kosong!";
                    }
                    // Simple URL validation
                    if (!value.startsWith('http://') && !value.startsWith('https://')) {
                      return "URL harus dimulai dengan http:// atau https://";
                    }
                    // Check if URL ends with common image extensions
                    final validExtensions = ['.jpg', '.jpeg', '.png', '.gif', '.webp'];
                    final hasValidExtension = validExtensions.any((ext) => 
                      value.toLowerCase().endsWith(ext)
                    );
                    if (!hasValidExtension) {
                      return "URL harus mengarah ke file gambar (.jpg, .jpeg, .png, .gif, .webp)";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                // Category field (Dropdown)
                FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        labelText: "Kategori",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        errorText: state.errorText,
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _category,
                          hint: const Text("Pilih Kategori"),
                          isExpanded: true,
                          items: _categories.map((String category) {
                            return DropdownMenuItem<String>(
                              value: category,
                              child: Text(category),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _category = newValue;
                              state.didChange(newValue);
                            });
                          },
                        ),
                      ),
                    );
                  },
                  validator: (String? value) {
                    if (_category == null || _category!.isEmpty) {
                      return "Kategori tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                // isFeatured field (Switch) - Clickable entire row
                InkWell(
                  onTap: () {
                    setState(() {
                      _isFeatured = !_isFeatured;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      children: [
                        const Text(
                          'Produk Unggulan',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        const Spacer(),
                        Switch(
                          value: _isFeatured,
                          onChanged: (bool value) {
                            setState(() {
                              _isFeatured = value;
                            });
                          },
                          activeTrackColor: Theme.of(context).colorScheme.primary,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),

                // Save button
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32.0,
                        vertical: 16.0,
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Produk berhasil tersimpan'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Nama: $_name'),
                                    Text('Harga: Rp $_price'),
                                    Text('Deskripsi: $_description'),
                                    Text('Thumbnail: $_thumbnail'),
                                    Text('Kategori: $_category'),
                                    Text('Produk Unggulan: ${_isFeatured ? "Ya" : "Tidak"}'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _formKey.currentState!.reset();
                                    setState(() {
                                      _name = "";
                                      _price = 0;
                                      _description = "";
                                      _thumbnail = "";
                                      _category = null;
                                      _isFeatured = false;
                                    });
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

