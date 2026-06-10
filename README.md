# 🎬 Animation Collection ISS24055 🎬

**Animation Collection** adalah aplikasi Flutter yang dirancang untuk membawa Anda bernostalgia melalui koleksi animasi legendaris dari berbagai era, mulai dari klasik tahun 1950-an hingga era modern 2020-an.

## ✨ Fitur Utama

- **🌍 Penjelajahan Berdasarkan Era**: Temukan kartun favorit Anda melalui 6 kategori era yang unik (1950-1970an hingga 2020an).
- **📋 Daftar Animasi Lengkap**: Berisi total **42 judul animasi** populer dengan detail studio dan tahun rilis.
- **🔍 Detail Mendalam**: Informasi lengkap untuk setiap animasi termasuk genre, negara asal, bahasa, deskripsi, dan tipe (Film/Series).
- **📺 Integrasi YouTube**: Tombol langsung untuk mencari dan menonton cuplikan animasi di YouTube.
- **🌓 Mode Terang & Gelap**: Sistem tema yang adaptif untuk kenyamanan mata Anda, dapat diubah melalui tombol toggle global.
- **📱 Desain Responsif**: Tampilan yang optimal baik saat dijalankan di perangkat Mobile (HP) maupun di Browser (Web).
- **🎨 UI Minimalis & Modern**: Menggunakan skema warna Biru (#1565C0) dan Kuning (#FDD835) dengan sentuhan background soft.

## 🛠️ Teknologi yang Digunakan

- **Framework**: [Flutter](https://flutter.dev/)
- **Bahasa Pemrograman**: [Dart](https://dart.dev/)
- **Navigasi**: `go_router` (Stateful Shell Route)
- **Fungsi Eksternal**: `url_launcher` (untuk membuka link YouTube)

## 📁 Struktur Folder

- `lib/models/`: Definisi model data `AnimationModel`.
- `lib/data/`: Database lokal yang berisi 42 entri animasi.
- `lib/navigation/`: Konfigurasi routing menggunakan `AppRouter`.
- `lib/screens/`: Halaman utama aplikasi (Home, List, Detail, Profile).
- `lib/widgets/`: Komponen UI pendukung seperti `MainWrapper`.
- `assets/images/`: Seluruh aset gambar animasi kualitas HD.

## 🚀 Cara Menjalankan Project

1. **Persiapan**: Pastikan Flutter SDK sudah terinstal di komputer Anda.
2. **Clone/Download**: Masuk ke direktori project.
3. **Instal Dependensi**:
   ```bash
   flutter pub get
   ```
4. **Jalankan Aplikasi**:
   ```bash
   flutter run
   ```

## 👩‍💻 Pengembang

**Theresia Oktaviani**  
ID: **12S24055**  

*"Saya adalah seorang penggemar animasi yang membangun aplikasi ini untuk memudahkan semua orang bernostalgia dan menonton kembali kartun favorit mereka. Semoga aplikasi ini membawa kenangan indah masa kecil kamu kembali!"*

---
© 2026 Animation Collection Project.
